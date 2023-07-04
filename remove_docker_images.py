with open("images_list.txt",'r') as file:
    print(file.readlines())
    source = file.readlines()
    length = len(source)
    print(length)

# images = []
# for i in range(len(source)):
#     for name in source:
#         images.append(name[i][31:43])

# print(images)