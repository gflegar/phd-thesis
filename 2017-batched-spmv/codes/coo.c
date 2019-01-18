void SpMV_COO(int nnz, int *rowidx, int *colidx, float *val, float *x, float *y) {
  for (int i = 0; i < nnz; ++i) {
    y[ rowidx[i] ] += val[i] * x[ colidx[i] ];
  }
}

