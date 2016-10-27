package org.DAGD.Arcade {
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	public class View extends Sprite {


		public function View() {
		}
		public function dataUpdated():void {
			/* override this */
		}
		public function layout(w: int, h: int): void {
			/* override this */
		}
		public function dispose():void {
			/* override this */
		}
	}
}