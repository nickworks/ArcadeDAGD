package org.DAGD.Arcade {
	import flash.display.Sprite;

	public class SideView extends View {

		public function SideView() {
			// constructor code
		}
		override public function layout(w: int, h: int): void {
			var sprite: Sprite = new Sprite();

			sprite.graphics.drawRect(0,0,w,h);
			sprite.graphics.beginFill(0xa12525);
			trace("drawn");
		}
	}

}