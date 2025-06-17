package main

import(
	"fyne.io/fyne/v2/widget"
	"fyne.io/fyne/v2"
)

type buttonFunc func()

func button(name string, ret buttonFunc) (button fyne.Widget){
	button = widget.NewButton(name, ret)
	return
}