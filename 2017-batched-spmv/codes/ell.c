void SpMV_ELL(int m, int max_nnz, int *colidx, float *val, float *x, float *y) {
  for (int i = 0; i < m; ++i) {
    for (int j = 0; j < max_nnz; ++j) {
      y[i] += val[i+j*m] * x[ colidx[i+j*m] ];
    }
  }
}
