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

/***** ImageObject : �摜�\�� *****/
class ImageObject
{
private:

	/***** m_image: �摜 *****/
	TileTexture m_image;

	/***** m_alias: �G�C���A�X *****/
	char *m_alias;

	/***** m_normal: �@���x�N�g�� *****/
	float m_normal[3];

	/***** m_face: �Жʕ\�� *****/
	bool m_face;

	/***** m_enable: �L�� *****/
	bool m_enable;

	/***** initialize: ������ *****/
	void initialize();

	/***** clear: �N���A *****/
	void clear();

public:

	/***** TextObject: �R���X�g���N�^ *****/
	ImageObject();

	/***** ~TextObject: �f�X�g���N�^ *****/
	~ImageObject();

	/***** isEnable: �摜�̗L���m�F *****/
	bool isEnable();

	/***** set: �摜�̃Z�b�g *****/
	bool set(const char *alias, const char *fileName, float *size, float *position, float *rotation, bool face);

	/***** change: �摜�̍ăZ�b�g�Z�b�g *****/
	bool change(const char *fileName);

	/***** release: �摜�̊J�� *****/
	void release();

	/***** render: �摜�̃����_�����O *****/
	void render();

	/***** getAlias: �G�C���A�X�̎擾 *****/
	char *getAlias();
};
