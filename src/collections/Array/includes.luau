local types = require("../../es7-types")
type Array<T> = types.Array<T>
local indexOf = require("./indexOf")

return function<T>(array: Array<T>, searchElement: T, fromIndex: number?): boolean
	return indexOf(array, searchElement, fromIndex) ~= -1
end
