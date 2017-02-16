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

/***** initialize: 初期化 *****/
void ImageObject::initialize()
{
	m_alias = NULL;
	memset(m_normal, 0, sizeof(m_normal));
	m_face = false;
	m_enable = false;
}

/***** clear: クリア *****/
void ImageObject::clear()
{
	if (m_alias)
		free(m_alias);

	initialize();
}

/***** ImageObject: コンストラクタ *****/
ImageObject::ImageObject()
{
	initialize();
}

/***** ~ImageObject: デストラクタ *****/
ImageObject::~ImageObject()
{
	clear();
}

/***** isEnable: テキストの有効確認 *****/
bool ImageObject::isEnable()
{
	return m_enable;
}

/***** getAlias: エイリアスの取得 *****/
char *ImageObject::getAlias()
{
	return m_alias;
}

/***** set: テキストのセット *****/
bool ImageObject::set(const char *alias, const char *fileName, float *size, float *position, float *rotation, bool face)
{
	float p[4][3];
	float v[4][3];
	float n[3] = { 0.0f, 0.0f, 1.0f };
	float x, y, z;

	if (alias == NULL || fileName == NULL)
		return false;

	if (MMDAgent_strlen(alias) > 0 && m_alias != alias)
	{
		if (m_alias)
			free(m_alias);
		m_alias = MMDAgent_strdup(alias);
	}

	p[0][0] = -size[0] / 2.0f;
	p[0][1] = -size[1] / 2.0f;
	p[0][2] = 0.0f;

	p[1][0] = size[0] / 2.0f;
	p[1][1] = -size[1] / 2.0f;
	p[1][2] = 0.0f;

	p[2][0] = size[0] / 2.0f;
	p[2][1] = size[1] / 2.0f;
	p[2][2] = 0.0f;

	p[3][0] = -size[0] / 2.0f;
	p[3][1] = size[1] / 2.0f;
	p[3][2] = 0.0f;

	x = rotation[0] * 3.14159f / 180.0f;
	y = rotation[1] * 3.14159f / 180.0f;
	z = rotation[2] * 3.14159f / 180.0f;

	for (int i = 0; i < 4; i++)
	{
		v[i][0] = (p[i][0] * ((cos(y) * cos(z)) + (sin(x) * sin(y) * sin(z)))) + (p[i][1] * (-cos(y) * sin(z)) + (sin(x) * sin(y) * cos(z))) + (p[i][2] * (cos(x) * sin(y)));
		v[i][1] = (p[i][0] * (cos(x) * sin(z))) + (p[i][1] * (cos(x) * cos(z))) + (p[i][2] * (-sin(x)));
		v[i][2] = (p[i][0] * ((-sin(y) * cos(z)) + (sin(x) * cos(y) * sin(z)))) + (p[i][1] * ((sin(y) * sin(z)) + (sin(x) * cos(y) * cos(z)))) + (p[i][2] * (cos(x) * cos(y)));
	}

	for (int i = 0; i < 4; i++)
	{
		v[i][0] += position[0];
		v[i][1] += position[1];
		v[i][2] += position[2];
	}

	m_image.setSize(v[0][0], v[0][1], v[0][2], v[1][0], v[1][1], v[1][2], v[2][0], v[2][1], v[2][2], v[3][0], v[3][1], v[3][2], 1.0f, 1.0f);
	if (m_image.load(fileName) == false)
		return false;

	m_normal[0] = (n[0] * ((cos(y) * cos(z)) + (sin(x) * sin(y) * sin(z)))) + (n[1] * (-cos(y) * sin(z)) + (sin(x) * sin(y) * cos(z))) + (n[2] * (cos(x) * sin(y)));
	m_normal[1] = (n[0] * (cos(x) * sin(z))) + (n[1] * (cos(x) * cos(z))) + (n[2] * (-sin(x)));
	m_normal[2] = (n[0] * ((-sin(y) * cos(z)) + (sin(x) * cos(y) * sin(z)))) + (n[1] * ((sin(y) * sin(z)) + (sin(x) * cos(y) * cos(z)))) + (n[2] * (cos(x) * cos(y)));

	m_face = face;
	m_enable = true;
	return true;
}

/***** change: 画像の再セットセット *****/
bool ImageObject::change(const char *fileName)
{
	if (fileName == NULL)
		return false;

	if (m_image.load(fileName) == false)
		return false;

	return true;
}

/***** release: 画像の開放 *****/
void ImageObject::release()
{
	clear();
}

/***** render: 画像のレンダリング *****/
void ImageObject::render()
{
	m_image.render(m_face, m_normal);
}