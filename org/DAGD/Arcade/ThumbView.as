package org.DAGD.Arcade {

	public class ThumbView extends MainView {

		private var buttons:Array = new Array(); // holds MediaButton objects
		
		public function ThumbView() {
			
			makeButtons();
			
		}
		/**
		* dataUpdated() is initiated after the data has finished loading
		* in ArcadeOS
		* 
		* Then tells the following function, makeButtons,
		* it can now run
		*
		*/
		public override function dataUpdated():void {
			makeButtons();
		}
		
		/**
		* makeButtons() adds the clickable projects to the screen as buttons
		* 
		* It goes through the ArcadeOS array "collection" and pulls the media data from
		* MediaModel then inputs it into the MediaButton class
		* This information is posted onto the MainView stage and then stored in the "buttons" array
		*
		*/
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
		/**
		* removeButtons() runs through the "buttons" array 
		* and removes all button information 
		* through the dispose function
		* Then it removes the buttons from the screen
		* 
		* Finally instantiating a new buttons array to replace the old one
		*/
		private function removeButtons():void {
			// REMOVE ALL OLD BUTTONS:
			for each(var bttn:MediaButton in buttons){
				bttn.dispose();
				removeChild(bttn);
			}
			buttons = new Array();
		}
		/**
		* layout() lays out MainView as the ThumbView
		* 
		* It figures out the size of the MainView stage and calculates
		* how many collumns of media it can fit then figures 
		* Media Width and Height plus the size of its margins
		*
		* Afterwards, running through the "buttons" array and assigning
		* the media to a grid position and placing them in their proper
		* x and y coordinates.
		*
		* @param w:int pulls in the width of the stage minus the width of the SideView
		* @param h:int pulls in a set height from ArcadeOS for the media window
		*/
		override public function layout(w: int, h: int): void {
			
			var cols: Number = Math.floor(w / MediaButton.WIDTH);
			var spaceX: int = MediaButton.WIDTH + MediaButton.MARGIN;
			var spaceY: int = MediaButton.HEIGHT + MediaButton.MARGIN;
			var sideMargins: int = (w - (spaceX*cols))/2;
			
			for (var i = 0; i < buttons.length; i++) {
				
				var gridX: int = i % cols;
				var gridY: int = Math.floor(i / cols);

				buttons[i].x = gridX * spaceX + sideMargins;				
				//buttons[i].x = gridX * spaceX + MediaButton.MARGIN;
				buttons[i].y = gridY * spaceY;

			}
		}

	}

}