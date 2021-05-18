import kivy
from kivy.app import App
from kivy.uix.label import Label

class Demo(App):
    def build(self):
        label = Label(text='Hello World')
        label.font_size = '50dp'
        return label

if __name__ == '__main__':
    Demo().run()
