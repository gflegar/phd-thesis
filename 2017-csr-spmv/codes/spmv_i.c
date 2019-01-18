const int T = thread_count; // degree of thread concurrency
void SpMVI(int m, int *rowptr, int *colidx, float *val, float *x, float *y) {
  int row = -1, next_row = 0, nnz = rowptr[m];
  for (int k = 0; k < T; ++k) {  // this loop should be parallelized
    for (int i = k*nnz / T; i < (k+1)*nnz / T; ++i) {
      while (i >= next_row) next_row = rowptr[ ++row+1 ];
      y[row] += val[i] * x[ colidx[i] ];
}}}

