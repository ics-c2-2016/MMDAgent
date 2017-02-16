/* ----------------------------------------------------------------- */
/*           The Toolkit for Building Voice Interaction Systems      */
/*           "MMDAgent" developed by MMDAgent Project Team           */
/*           http://www.mmdagent.jp/                                 */
/* ----------------------------------------------------------------- */
/*                                                                   */
/*  Copyright (c) 2009-2016  Nagoya Institute of Technology          */
/*                           Department of Computer Science          */
/*                                                                   */
/* All rights reserved.                                              */
/*                                                                   */
/* Redistribution and use in source and binary forms, with or        */
/* without modification, are permitted provided that the following   */
/* conditions are met:                                               */
/*                                                                   */
/* - Redistributions of source code must retain the above copyright  */
/*   notice, this list of conditions and the following disclaimer.   */
/* - Redistributions in binary form must reproduce the above         */
/*   copyright notice, this list of conditions and the following     */
/*   disclaimer in the documentation and/or other materials provided */
/*   with the distribution.                                          */
/* - Neither the name of the MMDAgent project team nor the names of  */
/*   its contributors may be used to endorse or promote products     */
/*   derived from this software without specific prior written       */
/*   permission.                                                     */
/*                                                                   */
/* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND            */
/* CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,       */
/* INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF          */
/* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE          */
/* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS */
/* BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,          */
/* EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED   */
/* TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,     */
/* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON */
/* ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,   */
/* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY    */
/* OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE           */
/* POSSIBILITY OF SUCH DAMAGE.                                       */
/* ----------------------------------------------------------------- */

/* definitions */

#ifdef _WIN32
#define EXPORT extern "C" __declspec(dllexport)
#else
#if TARGET_OS_IPHONE
#define EXPORT
#define extAppStart Plugin_VIManager_extAppStart
#define extProcMessage Plugin_VIManager_extProcMessage
#define extRender Plugin_VIManager_extRender
#define extAppEnd Plugin_VIManager_extAppEnd
#else
#define EXPORT extern "C"
#endif
#endif /* _WIN32 */

#define PLUGINVIMANAGER_NAME "VIManager"
#define MMDAGENT_COMMAND_FSTRELOAD "RELOAD"
#define MMDAGENT_COMMAND_FSTRELOAD_ALL "ALL"
#define MMDAGENT_COMMAND_FSTRELOAD_MAIN "MAIN"
#define MMDAGENT_COMMAND_FSTRELOAD_SUB "SUB"

/* headers */

#include "MMDAgent.h"
#include "VIManager.h"
#include "VIManager_Logger.h"
#include "VIManager_Thread.h"

/* variables */

static VIManager_Thread vimanager_thread;
static bool enable;
static bool enable_log;

/* extAppStart: load FST and start thread *///起動時にfstを呼び出し
EXPORT void extAppStart(MMDAgent *mmdagent)
{
   char *buf;
   int len;

   buf = MMDAgent_strdup(mmdagent->getConfigFileName());
   len = MMDAgent_strlen(buf);
   if (len > 4) {
      buf[len - 4] = '.';
      buf[len - 3] = 'f';
      buf[len - 2] = 's';
      buf[len - 1] = 't';
	  //loadAndStartでロード
      vimanager_thread.loadAndStart(mmdagent, buf, 0);
   }
   if(buf)
      free(buf);

   enable = true;
   enable_log = false;
   mmdagent->sendMessage(MMDAGENT_EVENT_PLUGINENABLE, "%s", PLUGINVIMANAGER_NAME);
}

/* extProcMessage: process message *///RELOADが呼び出されるとき実行(type:コマンド名、args:オプション的存在)
//コマンドイメージ・・・「type|args」
EXPORT void extProcMessage(MMDAgent *mmdagent, const char *type, const char *args)
{
   if(enable == true) {
      if(MMDAgent_strequal(type, MMDAGENT_COMMAND_PLUGINDISABLE)) {
         if(MMDAgent_strequal(args, PLUGINVIMANAGER_NAME)) {
            enable = false;
            mmdagent->sendMessage(MMDAGENT_EVENT_PLUGINDISABLE, "%s", PLUGINVIMANAGER_NAME);
         }
      } else if (vimanager_thread.isRunning()) {
         if (type != NULL) {
            vimanager_thread.enqueueBuffer(type, args); /* enqueue */
         }
      }
      if(MMDAgent_strequal(type, MMDAGENT_EVENT_KEY) && MMDAgent_strequal(args, "F")) {
         if(enable_log == true)
            enable_log = false;
         else
            enable_log = true;
      }
   } else {
      if(MMDAgent_strequal(type, MMDAGENT_COMMAND_PLUGINENABLE)) {
         if(MMDAgent_strequal(args, PLUGINVIMANAGER_NAME)) {
            enable = true;
            mmdagent->sendMessage(MMDAGENT_EVENT_PLUGINENABLE, "%s", PLUGINVIMANAGER_NAME);
         }
      }
   }
   //リロード部分
   if (MMDAgent_strequal(type, MMDAGENT_COMMAND_FSTRELOAD)) {
	   //今保持しているfstデータを消去
	   vimanager_thread.stopAndRelease();
	   char *buf;
	   int len;
	   //fst名を確認(mdfファイルと同一名称を呼び出す)
	   buf = MMDAgent_strdup(mmdagent->getConfigFileName());
	   len = MMDAgent_strlen(buf);
	   if (len > 4) {
		   buf[len - 4] = '.';
		   buf[len - 3] = 'f';
		   buf[len - 2] = 's';
		   buf[len - 1] = 't';
		   //RELOAD|ALLのとき、メイン・サブを書き換え(第3引数0)
		   if (MMDAgent_strequal(args, MMDAGENT_COMMAND_FSTRELOAD_ALL)) {
			   vimanager_thread.loadAndStart(mmdagent, buf, 0);
		   }
		   //RELOAD|MAINのとき、メインだけ書き換え(第3引数1)
		   else if (MMDAgent_strequal(args, MMDAGENT_COMMAND_FSTRELOAD_MAIN)) {
			   vimanager_thread.loadAndStart(mmdagent, buf, 1);
		   }
		   //RELOAD|SUBのとき、サブだけ書き換え(第3引数2)
		   else if (MMDAgent_strequal(args, MMDAGENT_COMMAND_FSTRELOAD_SUB)) {
			   vimanager_thread.loadAndStart(mmdagent, buf, 2);
		   }
	   }
	   if (buf)
		   free(buf);

	   //enable = true;
	   //enable_log = false;
	   mmdagent->sendMessage(MMDAGENT_EVENT_PLUGINENABLE, "%s", PLUGINVIMANAGER_NAME);
   }
}

/* extRender: render log */
EXPORT void extRender(MMDAgent *mmdagent)
{
   if(enable == true && enable_log == true)
      vimanager_thread.renderLog();
}

/* extAppEnd: stop and free thread */
EXPORT void extAppEnd(MMDAgent *mmdagent)
{
   vimanager_thread.stopAndRelease();
}
