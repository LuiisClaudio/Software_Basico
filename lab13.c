#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))
#define getsig(x)  ((x)>>31 & 1)
#define getexp(x)  ((x)>>23 & 0xff)
#define getfrac(x) ((x) & 0x7fffff)

float float2(float f);

float int2float(int i);

typedef union { 
  float f;
  unsigned int i;
 } U;

U u;

int main(void)
{
	//float2(15213.60);
	int2float(0x152);
	return 0;
}

float int2float(int i)
{
	unsigned int sig, frac, n = 0, b = 1, pos = 0, exp = 0, f = 0;
	float fl = (float)i;
	f = fl;
	u.i = fl;
	
	//printf("Int: %d, Float: %d\n", i, u.i);
	
	sig = 0x80000000 & i;

	if (i < 0)
		i = -1*(i);

	frac = i;

	while(n < 32)
	{
		if((frac & b) == b)
		{
			pos = n;
		}
		b = b << 1;
		n++;		
	}
	printf("\nPos: %d, N - Pos = %d\n", pos, (23 - pos));
	printf("\nSig: %x, Exp: %x, Man: %x\n\n", sig, exp, frac);
	if(pos <= 23)
	{
		frac = frac << (23 - pos);
	}
	else
	{
		frac = frac >> (pos - 2);
	}

	printf("\nSig: %x, Exp: %x, Man: %x\n\n", sig, exp, frac);	

	frac = frac & 0x7fffff;
	exp = pos + 127;
	printf("\nSig: %x, Exp: %x, Man: %x\n\n", sig, exp, frac);
	exp = exp << 23;
	sig = sig << 31;
	printf("\nSig: %x, Exp: %x, Man: %x\n\n", sig, exp, frac);

	u.i = 0;
	u.i = u.i | sig;
	u.i = u.i | exp;
	u.i = u.i | frac;
		
	printf("Float: %f", u.f);
	return u.f;
}

float float2(float f)
{
	unsigned int bin, binFrac, binExp, sig;
	u.f = f;
	bin = binFrac = binExp = sig = u.i;
	printf("%f, %x \n", u.f, bin);

	sig = sig >>31;
	sig = sig & 1;

	binExp = binExp >> 23;
	binExp = binExp& 0xFF;
	binFrac = binFrac & 0x7fffff;
	printf("\nSig: %x, Exp: %x, Man: %x\n\n", sig, binExp, binFrac);
	
	sig = sig << 31;
	u.i = u.i | sig;
	
        u.i = u.i | binFrac;
	
	binExp++;
	binExp = binExp << 23;
	u.i = u.i | binExp;
	
	printf("\nSig: %x, Exp: %x, Man: %x\n\n", sig, binExp, binFrac);

	printf("%f, %f \n", f, u.f);

	return f;
}
