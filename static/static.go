package static

import "embed"

//go:embed index.html favicon.ico css img js
var Static embed.FS
