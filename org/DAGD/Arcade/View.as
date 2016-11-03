package org.DAGD.Arcade {
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.events.Event;

	public class View extends Sprite {

		protected var selected:Boolean = false;

		public function View() {
			addEventListener(Event.ENTER_FRAME, handleFrame);
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
		private function handleFrame(e:Event):void {
			update();
		}
		protected function update():void {
			
		}
		public function dispose():void {
			/* override this */
			removeEventListener(Event.ENTER_FRAME, handleFrame);
		}
		public function setSelected(isSelected:Boolean):void {
			selected = isSelected;
		}
	}
}