package main

import (

	// "fyne.io/fyne/v2"
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/container"
	// "fyne.io/fyne/v2/widget"
)


// func floatTypecast(num float32) string {
// 	str := strconv.FormatFloat(float64(num), 'f', -1, 32)
// 	return str
// }

func main() {
	a := app.New()
	w := a.NewWindow("miracle sheets")

	bar := container.NewHBox(
		StatBar,
		
	)
	
	w.SetContent(container.NewVBox(
		bar,

	))

	w.ShowAndRun()
}