#include<stdio.h>

void NhapMang(int a[], int n){
    int i = 0;
    printf("\nNhap phan tu cua mang: \n");
	for(i; i < n; ++i){
        scanf("%d", &a[i]);
    }
}

void XuatMang(int a[], int n){
    int i = 0;
	for(i; i < n; ++i){
        printf("%3d", a[i]);
    }
    printf("\n");
}

void swap(int *a, int *b) 
{
    int temp = *a;
    *a = *b;
    *b = temp;
}


void heapSort(int a[], int n){
	int i = n / 2 - 1;
	for (i; i >= 0; i--){
		heapify(a, n, i);
	}
	
	int j = n - 1;
	for (j; j >= 0; j--){
		swap(&a[j], &a[0]);
		XuatMang(a, n);
		heapify(a, j, 0);
	}
}


void heapify(int a[], int n, int i){
	int max = i;
	int l = 2 * i + 1;
	int r = 2 * i + 2;
	
	if (l < n && a[l] > a[max]){
		max = l;
	}
	if (r < n && a[r] > a[max]){
		max = r;
	}
	
	if (max != i){
		swap(&a[max], &a[i]);
		heapify(a, n, max);
	}
}

int main() {
	int n;
	printf("Nhap so phan tu cua mang: \n");
	scanf("%d", &n);
	int a[n];
//	printf("\n======NHAP MANG=====\n");
	NhapMang(a, n);
	printf("\nSap xep: \n");
	heapSort(a, n);
	printf("\nKet qua: \n");
	XuatMang(a, n);
	return 0;
}

