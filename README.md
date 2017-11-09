# ZoomTree-Plugin 1.3 for Evolution cms
Zoom Tree plugin adds a small input range to zoom resource tree

![download](https://user-images.githubusercontent.com/7342798/32491842-781db978-c3b8-11e7-9b9e-ec7e2ad67309.png)

##troubleshooting

#### Q: Cant see the range input in Elements in Tree tabs

R: 
- Go to **Elements > Plugins > Edit Plugin Execution Order > OnManagerTreePrerender** 
- Drag **ZoomTree** Plugin ABOVE **Elements in Tree**
- Save

#### Q: I've disabled Zoom EIT option and Dont want see the range input in Elements in Tree tabs

R: 
- Go to **Elements > Plugins > Edit Plugin Execution Order > OnManagerTreePrerender** 
- Drag **ZoomTree** Plugin BELOW **Elements in Tree**
- Save

#### Q: The range input is positioned too low or too high, Can i change the margin from bottom?

R: 
- Go to **ZoomTree** configuration page
- Change settings **Margin from Bottom:**
- Save
