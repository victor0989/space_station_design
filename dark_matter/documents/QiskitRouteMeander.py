import qiskit_metal as metal
from qiskit_metal import designs, draw
from qiskit_metal import MetalGUI, Dict, Headings
from qiskit_metal.qlibrary.terminations.open_to_ground import OpenToGround
from qiskit_metal.qlibrary.tlines.meandered import RouteMeander

# Define a reusable function to create terminations
def create_open_to_ground(design, name, pos_x, pos_y, orientation):
    options = Dict(pos_x=pos_x, pos_y=pos_y, orientation=orientation)
    return OpenToGround(design, name, options=options)

# Create design and GUI
design = designs.DesignPlanar()
gui = MetalGUI(design)

# Get template options for RouteMeander
RouteMeander.get_template_options(design)
design.overwrite_enabled = True

# Create the terminations using the modular function
open_start_meander = create_open_to_ground(design, 'Open_meander_start', '1000um', '0um', '-90')
open_end_meander = create_open_to_ground(design, 'Open_meander_end', '1000um', '1500um', '90')

# Options for the meander resonator
meander_options = Dict(pin_inputs=Dict(
                            start_pin=Dict(component='Open_meander_start', pin='open'),
                            end_pin=Dict(component='Open_meander_end', pin='open')),
                      total_length='9mm',
                      fillet='99.99um')

# Create the meander resonator
testMeander = RouteMeander(design, 'meanderTest', options=meander_options)

# Build, scale, and focus on the components
gui.rebuild()
gui.autoscale()
gui.zoom_on_components([testMeander.name, open_start_meander.name, open_end_meander.name])

# Capture and save the visualization
gui.screenshot()
gui.figure.savefig('shot.png')

# Display image in IPython
from IPython.display import Image, display
_disp_ops = dict(width=500)
display(Image('shot.png', **_disp_ops))

# Close the GUI
gui.main_window.close()
