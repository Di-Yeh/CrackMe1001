#include <iostream>
using namespace std;

int main()
{
	char Passwd[] = "y@5Ft7y9xW3sgg]1Wvyj";
	int poffsetArray[20] = {7,4,3,0,1,8,9,2,5,6,6,5,2,9,8,1,0,3,4,7};
	char ans[11] = {0};

	int len = strlen(Passwd);
	int poffset = 0; /*r9*/

	cout << "解密前密码: " << Passwd << endl;
	
	for (int i=0 /*edx*/; i<len; i++)
	{
		int pValue = i; /*eax*/
		pValue = pValue & 0x80000001;

		if (pValue != 1)
		{
			pValue = poffsetArray[poffset];
			char tempPasswdValue = Passwd[i] - 0x5;
			ans[pValue] = tempPasswdValue;
		}

		poffset++;
	}
	
	cout << "解密后密码: " << ans << endl;

	return 0;
}
