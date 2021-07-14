#include<stdio.h>

int main(){
	int a;
	int b;
	scanf("%d",&a);
	scanf("%d",&b);
	if(a>0){
		if(b>0){
			printf("a and b are both positive integers");
		}
		else if(b<0){
			printf("a is positive but b is negative integer");
		}
		else{
			printf("Only a is positive integer");
		}
	}
	else if(a<0){
                if(b>0){
                        printf("a is negative but b is positive integer");
                }
                else if(b<0){
                        printf("a and b both are negative integers");
                }
                else{
                        printf("Only a is negative integer");
                }
        }
	else{
                if(b>0){
                        printf("Only  b is positive integer");
                }
                else if(b<0){
                        printf("Only b is negative integer");
                }
                else{
                        printf("Both are zero");
                }
        }
	printf("\n");
	return 0;
}
