// input: A, x, y
// outut: y = y+A*x
void coo_spmv(int nnz, const int *rowidx,
              const int *colidx, const float *val
              const float *x, float *y)
{
  for (int i = 0; i < nnz; ++i) {
    y[rowidx[i]] += val[i] * x[colidx[i]];
  }
}

