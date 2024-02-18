
eval:
	opa eval \
	--format pretty \
	--data main.rego \
	--data sample/data.json \
	--input sample/input.json \
	"data.app.main"