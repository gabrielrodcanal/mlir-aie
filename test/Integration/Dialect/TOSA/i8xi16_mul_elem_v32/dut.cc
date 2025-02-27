// clang-format off
void dut(int8_t * restrict v1, int16_t * restrict v2, int32_t * restrict v3) {
  size_t v4 = 0;
  size_t v5 = 1024;
  size_t v6 = 32;
  for (size_t v7 = v4; v7 < v5; v7 += v6)
  chess_prepare_for_pipelining
  chess_loop_range(32, 32)
  {
    v32int8 v8 = *(v32int8 *)(v1 + v7);
    v32int16 v9 = *(v32int16 *)(v2 + v7);
    v32int16 v10 = unpack(v8);
    v32acc32 v11 = mul_elem_32(v9, v10);
    v32int32 v12 = v32int32(v11);
    *(v32int32 *)(v3 + v7) = v12;
  }
  return;
}
// clang-format on
