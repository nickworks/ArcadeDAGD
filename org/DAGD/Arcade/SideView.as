package org.DAGD.Arcade {
	import flash.display.Sprite;

	public class SideView extends View {

		public function SideView() {
			// constructor code
		}
		
		/**
		* layout() lays out the side bar
		* and overrides the layout function in the View class
		*
		* @param w:int pulls in the width of the media window
		* @param h:int pulls in a set height from ArcadeOS for the media window
		*/
		override public function layout(w: int, h: int): void {
			graphics.beginFill(0xFFAAAA);
			graphics.drawRect(0, 0, w, h);
		}
	}
}