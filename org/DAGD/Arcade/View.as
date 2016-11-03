package org.DAGD.Arcade {
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	public class View extends Sprite {


		public function View() {
		}
		/**
		* dataUploaded() is primarily set for the MainView's children
		* to tell them when to start doing the addChild to the MainView
		*
		*/
		public function dataUpdated():void {
			/* override this */
		}
		/**
		* layout() is the base for the SideView and MainView
		* layouts.
		*
		* @param w:int pulls in the width of the media window
		* @param h:int pulls in a height from ArcadeOS for the media window
		*/
		public function layout(w: int, h: int): void {
			/* override this */
		}
		/**
		* dispose() removes data that is no longer needed
		*
		*/
		public function dispose():void {
			/* override this */
		}
	}
}