module.exports = {
	"env": {
		"browser": true,
		"node": true,
		"es6": true
	},
	"extends": [
		"eslint:recommended",
		"plugin:react/recommended"
	],
	"parserOptions": {
		"sourceType": "module",
		"ecmaFeatures": {
			"jsx": true
		},
		"ecmaVersion": 8
	},
	"plugins": [
		"react"
	],
	"rules": {
		"indent": [
			"error",
			"tab"
		],
		"quotes": [
			"error",
			"double"
		],
		"semi": [
			"error",
			"always"
		],
		"react/prop-types": [
			"off"
		],
		"no-console": 0
	}
};
