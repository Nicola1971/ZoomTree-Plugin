# ZoomTree-Plugin 1.3.2 for Evolution cms
Zoom Tree plugin adds a small input range to zoom resource tree

![zoomtreee](https://user-images.githubusercontent.com/7342798/33218965-05130402-d140-11e7-8e9a-8a3a7c88e888.jpg)
![download](https://user-images.githubusercontent.com/7342798/32491842-781db978-c3b8-11e7-9b9e-ec7e2ad67309.png)

# Troubleshooting

#### Q: Cant see the range input in Elements in Tree tabs

R: 
- Go to **Elements > Plugins > Edit Plugin Execution Order > OnManagerTreePrerender** 
- Drag **ZoomTree** Plugin ABOVE **Elements in Tree**
- Save

#### Q: I've disabled Zoom EIT option and Dont want see the range input in Elements in Tree tabs

R: 
- Go to **Elements > Plugins > Edit Plugin Execution Order > OnManagerTreePrerender** 
- Drag **ZoomTree** Plugin BELOW **Elements in Tree** :smile:
- Save

#### Q: The range input is positioned too low or too high, Can i change the margin from bottom?

R: 
- Go to **ZoomTree** configuration page
- Change settings **Margin from Bottom:**
- Save
