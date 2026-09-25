import numpy as np

def load_mem(path):
    with open(path) as f:
        vals = [int(line.strip(), 16) for line in f if line.strip()]
    return vals

g0 = load_mem('mem/g0_input.mem')
g7 = load_mem('sim/test_image.mem')

out_path = r'D:\vitis_workspace\bnn_test_app\src\test_samples.h'
with open(out_path, 'w') as f:
    f.write('#ifndef TEST_SAMPLES_H\n')
    f.write('#define TEST_SAMPLES_H\n\n')
    f.write('#include "xil_types.h"\n\n')
    f.write('// Sample 0: Eyes OPEN (Golden Logits: 911, -1117 -> Pred: 0 [ALERT])\n')
    f.write('static const u32 img_sample_open[1024] = {\n')
    for i in range(0, 1024, 8):
        chunk = [f'0x{v:08x}' for v in g0[i:i+8]]
        f.write('    ' + ', '.join(chunk) + (',' if i+8 < 1024 else '') + '\n')
    f.write('};\n\n')
    f.write('// Sample 7: Eyes CLOSED (Golden Logits: -697, 881 -> Pred: 1 [DROWSY])\n')
    f.write('static const u32 img_sample_closed[1024] = {\n')
    for i in range(0, 1024, 8):
        chunk = [f'0x{v:08x}' for v in g7[i:i+8]]
        f.write('    ' + ', '.join(chunk) + (',' if i+8 < 1024 else '') + '\n')
    f.write('};\n\n')
    f.write('#endif // TEST_SAMPLES_H\n')

print('Generated test_samples.h successfully')
