/****************************************************************************
Copyright (c) 2010 cocos2d-x.org

http://www.cocos2d-x.org

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
****************************************************************************/
#include "platform/CCCommon.h"
#include "CCStdC.h"

NS_CC_BEGIN

#define MAX_LEN         (cocos2d::kMaxLogLen + 1)

void CCLog(const char * pszFormat, ...)
{
    char buf[MAX_LEN];

    va_list args;
    va_start(args, pszFormat);        
    vsprintf(buf, pszFormat, args);
    va_end(args);
	
	fprintf(stderr, "cocos2d-x debug info %s\n",  buf);
}

void CCLog(const char * pszTag ,const char * pszFormat, ...) {
	char szBuf[MAX_LEN];

	va_list ap;
	va_start(ap, pszFormat);
	vsnprintf( szBuf, MAX_LEN, pszFormat, ap);
	va_end(ap);

	fprintf(stderr, "%s [%s]\n", pszTag, szBuf);
}

void CCMessageBox(const char * pszMsg, const char * pszTitle)
{
//    MessageBoxA(NULL, pszMsg, pszTitle, MB_OK);
	CCLog(pszMsg);
}

void CCLuaLog(const char * pszFormat)
{
    CCLog(pszFormat);
}

NS_CC_END

