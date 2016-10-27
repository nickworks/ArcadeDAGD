package org.DAGD.Arcade {

	public class ThumbView extends MainView {

		private var buttons:Array = new Array(); // holds MediaButton objects
		
		public function ThumbView() {
			
			makeButtons();
			
		}
		public override function dataUpdated():void {
			makeButtons();
		}
		private function makeButtons():void {

			removeButtons();
			
			// CREATE NEW BUTTONS:
			for (var i = 0; i < ArcadeOS.collection.length; i++) {
				var data: MediaModel = ArcadeOS.collection[i];
				var bttn: MediaButton = new MediaButton(data);
				addChild(bttn);
				buttons.push(bttn);
			}
		}
		private function removeButtons():void {
			// REMOVE ALL OLD BUTTONS:
			for each(var bttn:MediaButton in buttons){
				bttn.dispose();
				removeChild(bttn);
			}
			buttons = new Array();
		}
		override public function layout(w: int, h: int): void {
			
			var cols: Number = Math.floor(w / MediaButton.WIDTH);
			var spaceX: int = MediaButton.WIDTH + MediaButton.MARGIN;
			var spaceY: int = MediaButton.HEIGHT + MediaButton.MARGIN;
			
			for (var i = 0; i < buttons.length; i++) {
				
				var gridX: int = i % cols;
				var gridY: int = Math.floor(i / cols);

				buttons[i].x = gridX * spaceX;
				buttons[i].y = gridY * spaceY;

			}
		}

	}

}