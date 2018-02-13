module.exports = {
	"env": {
		"browser": true,
		"node": true,
		"es6": true
	},
	"extends": [
		"eslint:recommended"
	],
	"parserOptions": {
		"sourceType": "module",
		"ecmaVersion": 8
	},
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
		"no-console": 0
	}
};
