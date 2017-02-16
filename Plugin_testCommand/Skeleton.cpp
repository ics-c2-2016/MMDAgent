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

/***** include *****/
#include "MMDAgent.h"
#include "Skeleton_Thread.h"
#include "Skeleton.h"

/***** initialize: 初期化 *****/
void Image::initialize()
{
	m_mmdagent = NULL;
	m_imageObject = NULL;
}

/***** clear: クリア *****/
void Image::clear()
{
	if (m_imageObject)
		delete[] m_imageObject;

	initialize();
}

/***** VIManager_Logger: コンストラクタ *****/
Image::Image()
{
	initialize();
}

/***** ~VIManager_Logger: デストラクタ *****/
Image::~Image()
{
	clear();
}

/***** setup: セットアップ *****/
void Image::setup(MMDAgent *mmdagent)
{
	m_mmdagent = mmdagent;
	m_imageObject = new ImageObject[MAXIMAGE];
}

/***** getNewImageId: 新しい画像IDの取得 *****/
int Image::getNewImageId()
{
	int i;

	for (i = 0; i < MAXIMAGE; i++)
		if (m_imageObject[i].isEnable() == false)
			return i;

	return -1;
}

/***** findImageAlias: 画像の取得 *****/
int Image::findImageAlias(const char *alias)
{
	int i;

	if (alias)
		for (i = 0; i < MAXIMAGE; i++)
			if (m_imageObject[i].isEnable() && MMDAgent_strequal(m_imageObject[i].getAlias(), alias))
				return i;

	return -1;
}

/***** addImage: 画像の追加 *****/
bool Image::addImage(const char *arg)
{
	char *buff, *alias;
	char *argv[MMDAGENT_MAXNCOMMAND];
	char *temp, *save;
	int num = 0;
	int i, id;
	float size[2];
	float position[3], rotation[3];
	bool face;

	buff = MMDAgent_strdup(arg);

	for (temp = MMDAgent_strtok(buff, "|", &save); temp; temp = MMDAgent_strtok(NULL, "|", &save))
	{
		if (num >= MMDAGENT_MAXNCOMMAND)
			break;
		argv[num] = MMDAgent_strdup(temp);
		num++;
	}

	if (num < 3 || num > 6)
	{
		m_mmdagent->sendLogString("Error: %s: number of arguments should be 3-6.", PLUGINIMAGE_ADDIMAGECOMMAND);
		return false;
	}
	if (num >= 3)
	{
		if (MMDAgent_str2fvec(argv[2], size, 2) == false)
		{
			m_mmdagent->sendLogString("Error: %s: %s is not a size string.", PLUGINIMAGE_ADDIMAGECOMMAND, argv[2]);
			return false;
		}
	}
	else
	{
		size[0] = 10.0f;
		size[1] = 10.0f;
	}
	if (num >= 4)
	{
		if (MMDAgent_str2fvec(argv[3], position, 3) == false)
		{
			m_mmdagent->sendLogString("Error: %s: %s is not a position string.", PLUGINIMAGE_ADDIMAGECOMMAND, argv[3]);
			return false;
		}
	}
	else
		memset(position, 0, sizeof(position));
	if (num >= 5)
	{
		if (MMDAgent_str2fvec(argv[4], rotation, 3) == false)
		{
			m_mmdagent->sendLogString("Error: %s: %s is not a rotation string.", PLUGINIMAGE_ADDIMAGECOMMAND, argv[4]);
			return false;
		}
	}
	else
		memset(rotation, 0, sizeof(rotation));
	if (num >= 6)
	{
		if (MMDAgent_strequal(argv[5], "ON") == true)
			face = false;
		else if (MMDAgent_strequal(argv[5], "OFF") == true)
			face = true;
		else
		{
			m_mmdagent->sendLogString("Error: %s: %s is not a face string.", PLUGINIMAGE_ADDIMAGECOMMAND, argv[5]);
			return false;
		}
	}
	else
		face = false;

	id = getNewImageId();
	if (id == -1)
	{
		m_mmdagent->sendLogString("Error: addImage: number of image exceed the limit.");
		return false;
	}

	if (MMDAgent_strlen(argv[0]) > 0)
	{
		alias = MMDAgent_strdup(argv[0]);
		if (findImageAlias(alias) >= 0)
		{
			m_mmdagent->sendLogString("Error: addImage: Image alias \"%s\" is already used.", alias);
			free(alias);
			return false;
		}
	}
	else
	{
		for (i = 0; ; i++)
		{
			alias = MMDAgent_intdup(i);
			if (findImageAlias(alias) >= 0)
				free(alias);
			else
				break;
		}
	}

	if (!m_imageObject[id].set(argv[0], argv[1], size, position, rotation, face))
	{
		m_mmdagent->sendLogString("Error: addImage: %s cannot be set.", argv[1]);
		m_imageObject[id].release();
		free(alias);
		return false;
	}

	m_mmdagent->sendLogString(PLUGINIMAGE_ADDIMAGEEVENT, "%s", alias);
	free(alias);
	return true;
}

/***** changeText: 画像変更 *****/
bool Image::changeImage(const char *arg)
{
	char *buff, *temp, *save;
	char *argv[MMDAGENT_MAXNCOMMAND];
	int id;
	int num = 0;

	buff = MMDAgent_strdup(arg);

	for (temp = MMDAgent_strtok(buff, "|", &save); temp; temp = MMDAgent_strtok(NULL, "|", &save))
	{
		if (num >= MMDAGENT_MAXNCOMMAND)
			break;
		argv[num] = MMDAgent_strdup(temp);
		num++;
	}

	if (num != 2)
	{
		m_mmdagent->sendLogString("Error: %s: number of arguments should be 2.", PLUGINIMAGE_CHANGEIMAGECOMMAND);
		return false;
	}

	id = findImageAlias(argv[0]);
	if (id < 0)
	{
		m_mmdagent->sendLogString("Error: changeImage: %s is not found.", argv[0]);
		return false;
	}

	if (!m_imageObject[id].change(argv[1]))
	{
		m_mmdagent->sendLogString("Error: changeImage: %s cannot be set.", argv[1]);
		return false;
	}

	m_mmdagent->sendLogString(PLUGINIMAGE_CHANGEIMAGEEVENT, "%s", argv[0]);
	return true;
}

/***** deleteText: 画像削除 *****/
bool Image::deleteImage(const char *arg)
{
	char *buff, *temp, *save;
	char *argv[MMDAGENT_MAXNCOMMAND];
	int id;
	int num = 0;

	buff = MMDAgent_strdup(arg);

	for (temp = MMDAgent_strtok(buff, "|", &save); temp; temp = MMDAgent_strtok(NULL, "|", &save))
	{
		if (num >= MMDAGENT_MAXNCOMMAND)
			break;
		argv[num] = MMDAgent_strdup(temp);
		num++;
	}

	if (num != 1)
	{
		m_mmdagent->sendLogString("Error: %s: number of arguments should be 1.", PLUGINIMAGE_DELETEIMAGECOMMAND);
		return false;
	}

	id = findImageAlias(argv[0]);
	if (id < 0)
	{
		m_mmdagent->sendLogString("Error: deleteImage: %s is not found.", argv[0]);
		return false;
	}

	m_imageObject[id].release();
	m_mmdagent->sendLogString(PLUGINIMAGE_DELETEIMAGEEVENT, "%s", argv[0]);
	return true;
}

/***** render: レンダリング *****/
void Image::render()
{
	if (m_mmdagent == NULL)
		return;

	for (int i = 0; i < MAXIMAGE; i++)
	{
		if (m_imageObject[i].isEnable())
		{
			m_imageObject[i].render();
		}
	}
}