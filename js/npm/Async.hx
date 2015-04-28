package js.npm;

import haxe.Constraints;
import js.support.Either;

typedef AsyncCallback<T> = T -> Void;
typedef AsyncOptionalCallback<T> = ?T -> Void;
typedef AsyncMapCallback<Err, T> = Err -> T -> Void;

typedef AsyncSeriesCallback<Err> = AsyncCallback<Err> -> Void;
typedef AsyncSeriesMapCallback<Err, T> = AsyncMapCallback<Err, T> -> Void;

extern class Async
implements npm.Package.Require<"async", "^0.9.0">
{
	public static function each<T1, Err>(arr : Array<T1>, iterator : T1 -> AsyncOptionalCallback<Err> -> Void, callback : AsyncCallback<Err>) : Void;
	public static function eachSeries<T1, Err>(arr : Array<T1>, iterator : T1 -> AsyncOptionalCallback<Err> -> Void, callback : AsyncCallback<Err>) : Void;
	public static function eachLimit<T1, Err>(arr : Array<T1>, limit : Int, iterator : T1 -> AsyncOptionalCallback<Err> -> Void, callback : AsyncCallback<Err>) : Void;

	public static function map<T1, T2, Err>(arr : Array<T1>, iterator : T1 -> AsyncMapCallback<Err, T2> -> Void, callback : AsyncMapCallback<Err, Array<T2>>) : Void;
	public static function mapSeries<T1, T2, Err>(arr : Array<T1>, iterator : T1 -> AsyncMapCallback<Err, T2> -> Void, callback : AsyncMapCallback<Err, Array<T2>>) : Void;
	public static function mapLimit<T1, T2, Err>(arr : Array<T1>, limit : Int, iterator : T1 -> AsyncMapCallback<Err, T2> -> Void, callback : AsyncMapCallback<Err, Array<T2>>) : Void;

	public static function filter<T1, Err>(arr : Array<T1>, iterator : T1 -> AsyncCallback<Bool> -> Void, callback : AsyncCallback<Array<T1>>) : Void;
	public static function filterSeries<T1, Err>(arr : Array<T1>, iterator : T1 -> AsyncCallback<Bool> -> Void, callback : AsyncCallback<Array<T1>>) : Void;

	public static function reject<T1, Err>(arr : Array<T1>, iterator : T1 -> AsyncCallback<Bool> -> Void, callback : AsyncCallback<Array<T1>>) : Void;
	public static function rejectSeries<T1, Err>(arr : Array<T1>, iterator : T1 -> AsyncCallback<Bool> -> Void, callback : AsyncCallback<Array<T1>>) : Void;

	// reduce
	// reduceRight

	public static function detect<T1, Err>(arr : Array<T1>, iterator : T1 -> AsyncCallback<Bool> -> Void, callback : AsyncCallback<Null<T1>>) : Void;
	public static function detectSeries<T1, Err>(arr : Array<T1>, iterator : T1 -> AsyncCallback<Bool> -> Void, callback : AsyncCallback<Null<T1>>) : Void;

	public static function sortBy<T1, T2, Err>(arr : Array<T1>, iterator : T1 -> AsyncMapCallback<Err, T2> -> Void, callback : AsyncCallback<Array<T1>>) : Void;

	public static function some<T1>(arr : Array<T1>, iterator : T1 -> AsyncCallback<Bool> -> Void, callback : AsyncCallback<Bool>) : Void;
	public static function any<T1>(arr : Array<T1>, iterator : T1 -> AsyncCallback<Bool> -> Void, callback : AsyncCallback<Bool>) : Void;
	
	public static function every<T1>(arr : Array<T1>, iterator : T1 -> AsyncCallback<Bool> -> Void, callback : AsyncCallback<Bool>) : Void;
	public static function all<T1>(arr : Array<T1>, iterator : T1 -> AsyncCallback<Bool> -> Void, callback : AsyncCallback<Bool>) : Void;

	public static function concat<T1, T2, Err>(arr : Array<T1>, iterator : T1 -> AsyncMapCallback<Err, Array<T2>> -> Void, callback : AsyncMapCallback<Err, Array<T2>>) : Void;
	public static function concatSeries<T1, T2, Err>(arr : Array<T1>, iterator : T1 -> AsyncMapCallback<Err, Array<T2>> -> Void, callback : AsyncMapCallback<Err, Array<T2>>) : Void;

	public static function series<T1 : AsyncSeriesMapCallback<Err, T2>, T2, Err>(tasks : Array<T1>, ?callback : AsyncMapCallback<Err, Array<T2>>) : Void;

	public static function parallel<T1 : AsyncSeriesMapCallback<Err, T2>, T2, Err>(tasks : Array<T1>, ?callback : AsyncMapCallback<Err, Array<T2>>) : Void;
	public static function parallelLimit<T1 : AsyncSeriesMapCallback<Err, T2>, T2, Err>(tasks : Array<T1>, limit : Int, ?callback : AsyncMapCallback<Err, Array<T2>>) : Void;

	// The test function must be synchronous for whilst:
	public static function whilst<Err>(test : Void -> Bool, fn : AsyncSeriesCallback<Err>, callback : AsyncCallback<Err>) : Void;
	public static function doWhilst<Err>(fn : AsyncSeriesCallback<Err>, test : Void -> Bool, callback : AsyncCallback<Err>) : Void;
	
	// The test function must be synchronous for until:
	public static function until<Err>(test : Void -> Bool, fn : AsyncSeriesCallback<Err>, callback : AsyncCallback<Err>) : Void;
	public static function doUntil<Err>(fn : AsyncSeriesCallback<Err>, test : Void -> Bool, callback : AsyncCallback<Err>) : Void;
	
	public static function forever<Err>(fn : AsyncSeriesCallback<Err>, errback : AsyncCallback<Err>) : Void;

	public static function waterfall<T1, Err>(arr : Array<Function>, callback : AsyncMapCallback<Err, T1>) : Void;

	// compose
	// seq

	@:overload(function(fns : Array<Function>) : Function {})
	@:overload(function<T, T2, T3, T4, Err>(fns : Array<Function>, arg1 : T, arg2 : T2, arg3 : T3, arg4 : T4, callback : AsyncCallback<Err>) : Void {})
	@:overload(function<T, T2, T3, Err>(fns : Array<Function>, arg1 : T, arg2 : T2, arg3 : T3, callback : AsyncCallback<Err>) : Void {})
	@:overload(function<T, T2, Err>(fns : Array<Function>, arg1 : T, arg2 : T2, callback : AsyncCallback<Err>) : Void {})
	public static function applyEach<T, Err>(fns : Array<Function>, arg1 : T, callback : AsyncCallback<Err>) : Void;

	@:overload(function(fns : Array<Function>) : Function {})
	@:overload(function<T, T2, T3, T4, Err>(fns : Array<Function>, arg1 : T, arg2 : T2, arg3 : T3, arg4 : T4, callback : AsyncCallback<Err>) : Void {})
	@:overload(function<T, T2, T3, Err>(fns : Array<Function>, arg1 : T, arg2 : T2, arg3 : T3, callback : AsyncCallback<Err>) : Void {})
	@:overload(function<T, T2, Err>(fns : Array<Function>, arg1 : T, arg2 : T2, callback : AsyncCallback<Err>) : Void {})
	public static function applyEachSeries<T, Err>(fns : Array<Function>, arg1 : T, callback : AsyncCallback<Err>) : Void;

	// queue
	// priorityQueue
	// cargo
	// auto

	public static function retry<T, Err>(times : Int, task : AsyncSeriesMapCallback<Err, T>, ?callback : AsyncMapCallback<Err, T>) : Void;

	// iterator

	// apply: Use Haxe's bind instead

	public static function nextTick(callback : Void -> Void) : Void;

	public static function times<T1, T2, Err>(times : Int, iterator : Int -> AsyncMapCallback<Err, T2> -> Void, callback : AsyncMapCallback<Err, Array<T2>>) : Void;
	public static function timesSeries<T1, T2, Err>(times : Int, iterator : Int -> AsyncMapCallback<Err, T2> -> Void, callback : AsyncMapCallback<Err, Array<T2>>) : Void;

	// memoize
	// unmemoize

	@:overload(function<T, T2, T3, T4, T5, Err>(fn : T2 -> T3 -> T4 -> T5 -> AsyncMapCallback<Err, T> -> Void, arg1 : T2, arg2 : T3, arg3 : T4, arg4 : T5) : Void {})
	@:overload(function<T, T2, T3, T4, Err>(fn : T2 -> T3 -> T4 -> AsyncMapCallback<Err, T> -> Void, arg1 : T2, arg2 : T3, arg3 : T4) : Void {})
	@:overload(function<T, T2, T3, Err>(fn : T2 -> T3 -> AsyncMapCallback<Err, T> -> Void, arg1 : T2, arg2 : T3) : Void {})
	public static function log<T, T2, Err>(fn : T2 -> AsyncMapCallback<Err, T> -> Void, arg1 : T2) : Void;

	@:overload(function<T, T2, T3, T4, T5, Err>(fn : T2 -> T3 -> T4 -> T5 -> AsyncMapCallback<Err, T> -> Void, arg1 : T2, arg2 : T3, arg3 : T4, arg4 : T5) : Void {})
	@:overload(function<T, T2, T3, T4, Err>(fn : T2 -> T3 -> T4 -> AsyncMapCallback<Err, T> -> Void, arg1 : T2, arg2 : T3, arg3 : T4) : Void {})
	@:overload(function<T, T2, T3, Err>(fn : T2 -> T3 -> AsyncMapCallback<Err, T> -> Void, arg1 : T2, arg2 : T3) : Void {})
	public static function dir<T, T2, Err>(fn : T2 -> AsyncMapCallback<Err, T> -> Void, arg1 : T2) : Void;

	public static function noConflict() : Class<Async>;
}