import gradio as gr
from codrone_edu.drone import *

with gr.Blocks() as demo:
    with gr.Column():
        with gr.Row():
            forward_button = gr.Button('Forward', scale=5)
        with gr.Row():
            left_buttom = gr.Button('Left', scale=5)
            up_buttom = gr.Button('Up', scale=5)
            right_buttom = gr.Button('Right', scale=5)
    

    

demo.launch()