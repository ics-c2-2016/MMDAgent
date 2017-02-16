/* ----------------------------------------------------------------- */
/*           The Toolkit for Building Voice Interaction Systems      */
/*           "MMDAgent" developed by MMDAgent Project Team           */
/*           http://www.mmdagent.jp/                                 */
/* ----------------------------------------------------------------- */
/*                                                                   */
/*  Copyright (c) 2009-2012  Nagoya Institute of Technology          */
/*                           Department of Computer Science          */
/*  All rights reserved.                                             */
/*                                                                   */
/*  Copyright (c) 2012-2013  CUBE370                                 */
/*  All rights reserved.                                             */
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

//*********************************************************************
//	�y�\�t�g���z  MMDAgent-1.3.1�p�摜�\���v���O�C��
//	�y�o�[�W�����z0.1.0.0
//	�y����ҁz    CUBE370
//	�y�����HP�z  http://cube370.blog87.fc2.com/
//	�y���J���z    2013/01/12
//	�y�z�z���z    http://cube370.blog87.fc2.com/
//	�y��pwiki�z  http://cube370.wiki.fc2.com/
//*********************************************************************

/***** define *****/
#define EXPORT extern "C" __declspec(dllexport)
#define PLUGINIMAGE_NAME    "Image"

/***** include *****/
#include "MMDAgent.h"
#include "Skeleton_Thread.h"
#include "Skeleton.h"

/***** variables *****/
static Image m_image;
static bool enable;

/***** extAppStart: �v���O�C�����[�h & �X���b�h�J�n *****/
EXPORT void extAppStart(MMDAgent *mmdagent)
{
	m_image.setup(mmdagent);

	enable = true;
	mmdagent->sendMessage(MMDAGENT_EVENT_PLUGINENABLE, PLUGINIMAGE_NAME);
}

/***** extProcCommand: �R�}���h���b�Z�[�W��M������ *****/
EXPORT void extProcMessage(MMDAgent *mmdagent, const char *type, const char *args)
{
	if (enable == true)
	{
		if (MMDAgent_strequal(type, MMDAGENT_COMMAND_PLUGINDISABLE))
		{
			if (MMDAgent_strequal(args, PLUGINIMAGE_NAME))
			{
				enable = false;
				mmdagent->sendMessage(MMDAGENT_EVENT_PLUGINDISABLE, PLUGINIMAGE_NAME);
			}
		}
		else if (MMDAgent_strequal(type, PLUGINIMAGE_ADDIMAGECOMMAND))
		{
			m_image.addImage(args);
		}
		else if (MMDAgent_strequal(type, PLUGINIMAGE_CHANGEIMAGECOMMAND))
		{
			m_image.changeImage(args);
		}
		else if (MMDAgent_strequal(type, PLUGINIMAGE_DELETEIMAGECOMMAND))
		{
			m_image.deleteImage(args);
		}
	}
	else
	{
		if (MMDAgent_strequal(type, MMDAGENT_COMMAND_PLUGINENABLE))
		{
			if (MMDAgent_strequal(args, PLUGINIMAGE_NAME))
			{
				enable = true;
				mmdagent->sendMessage(MMDAGENT_EVENT_PLUGINENABLE, PLUGINIMAGE_NAME);
			}
		}
	}
}


/***** extRender: �`�揈�� *****/
EXPORT void extRender(MMDAgent *mmdagent)
{
	if (enable == true)
		m_image.render();
}

/***** extAppEnd: �v���O�C���I�� & �X���b�h�J�� *****/
EXPORT void extAppEnd(MMDAgent *mmdagent)
{
}