package org.DAGD.Arcade {
	import flash.display.Sprite;

	public class SideView extends View {

		public function SideView() {
			// constructor code
		}
		override public function layout(w: int, h: int): void {
			graphics.beginFill(0xFFAAAA);
			graphics.drawRect(0, 0, w, h);
		}
	}
}