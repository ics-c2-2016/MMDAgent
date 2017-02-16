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

/***** define *****/
#define MAXIMAGE		128
#define PLUGINIMAGE_ADDIMAGECOMMAND		"IMAGE_ADD"
#define PLUGINIMAGE_CHANGEIMAGECOMMAND	"IMAGE_CHANGE"
#define PLUGINIMAGE_DELETEIMAGECOMMAND	"IMAGE_DELETE"
#define PLUGINIMAGE_ADDIMAGEEVENT		"IMAGE_EVENT_ADD"
#define PLUGINIMAGE_CHANGEIMAGEEVENT	"IMAGE_EVENT_CHANGE"
#define PLUGINIMAGE_DELETEIMAGEEVENT	"IMAGE_EVENT_DELETE"

/***** Image : テキスト表示 *****/
class Image
{
private:

	MMDAgent *m_mmdagent;

	/***** m_imageObject: 画像オブジェクト *****/
	ImageObject *m_imageObject;

	/***** initialize: 初期化 *****/
	void initialize();

	/***** clear: クリア *****/
	void clear();

	/***** getNewImageId: 新しい画像IDの取得 *****/
	int getNewImageId();

	/***** findImageAlias: エイリアスの取得 *****/
	int findImageAlias(const char *alias);

public:

	/***** Text: コンストラクタ *****/
	Image();

	/***** ~Text: デストラクタ *****/
	~Image();

	/***** setup: セットアップ *****/
	void setup(MMDAgent *mmdagent);

	/***** addImage: 画像追加 *****/
	bool addImage(const char *arg);

	/***** changeText: 画像変更 *****/
	bool changeImage(const char *arg);

	/***** deleteImage: 画像削除 *****/
	bool deleteImage(const char *arg);

	/***** render: レンダリング *****/
	void render();
};
