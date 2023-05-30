a) Wie wird Input in das Spiel integriert? Welche Schritte sind notwendig?
- Configure Inputs inside the Input Map (Project -> Project Settings) 
 - We can Map an Input to multiple Physical Inputs (Keyboard, Mouse, etc)
- Mapped inputs can then be detected inside the code using `Input.is_action_pressed()`
- When computed, we first want to describe a direction Vector by increment or decrementing the x or y Axis (depends on the pressed input)
- We then multiply this vector (first normalized, reason is explained in question b) ) by the speed var and the amount of time the previous frame took to complete (ensure that movement remain consistent)

b) Warum wird velocity normalisiert? Was passiert, wenn dies nicht vollzogen wird?
- Normalizing Vector movement is useful to avoid having different movement speed
 - Up/right/down/left input won't have any difference, but combined (i.e. diagonal movement) the speed will then increase
 - Normalizing those Vector always sets them to a value of 1, which allow to avoid this movement speed difference

c) Welche Schritte sind notwendig, um Kollisionen im Spiel zu implementieren?
- Player Root node is Area2D, which to detect when another node enters the area
- Hit signal, allow then to communicate between the nodes and to understand what's happening, when there is a collision (using the _on_body_entered signal)
- Mob node also has a CollisionShape2D, in order to trigger the on_body_entered signal

# Task 2:
## Eliot:
## Eve:
**Font**:
- Go to HUD scene
- import a .ttf file into the file system. It has to go directly in the explorer, because you can't import assets directly into Godot
- In Godot, go to the Textfield you want to change
    - under _Control/Theme Overrides/Fonts_ you can insert the Font
    - either by draging it in or by choosing _Load_ or _Quick Load_
- It may be a good idea to change the font size under _Control/Theme Overrides/Font Sizes_