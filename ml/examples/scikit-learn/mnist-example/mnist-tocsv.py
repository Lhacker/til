import struct

def to_csv(name, maxdata):
    label_file = open('./mnist/' + name + '-labels-idx1-ubyte', 'rb')
    image_file = open('./mnist/' + name + '-images-idx3-ubyte', 'rb')
    csv_file = open('./mnist/' + name + '.csv', 'w', encoding='utf-8')

    magic_number, label_count = struct.unpack('>II', label_file.read(8))
    magic_number, image_count = struct.unpack('>II', image_file.read(8))
    rows, cols = struct.unpack('>II', image_file.read(8))
    pixels = rows * cols

    res = []
    for idx in range(label_count):
        if idx > maxdata:
            break
        label = struct.unpack('B', label_file.read(1))[0]
        bdata = image_file.read(pixels)
        
