import csv, json

scene_data_names = ['id', 'entrance', 'name', 'translation', 'display_name', "what?"]
scene_entries = {}

with open('scene_table.csv', newline='') as csvfile:
    scene_reader = csv.reader(csvfile, delimiter='\t', quotechar='|')
    for row in scene_reader:
        # print(', '.join(row))

        scene_data = {}
        for i in range(0, len(row)):
            scene_data[scene_data_names[i]] = row[i]
        
        scene_entries[int(scene_data['id'], 16)] = scene_data
        
for id in range(0, int("FF", 16) + 1):
    display_name = "Unknown Scene"
    
    if id in scene_entries:
        if "display_name" in scene_entries[id] and len(scene_entries[id]["display_name"]) > 0:
            display_name = scene_entries[id]["display_name"]
    print(f"{{ {id}, \"{display_name}\" }},")