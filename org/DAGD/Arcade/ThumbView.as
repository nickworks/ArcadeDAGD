package org.DAGD.Arcade {

	public class ThumbView extends MainView {

		public function ThumbView() {
			// constructor code
		}
		override public function layout(w: int, h: int): void {
			var view: View = new View();
			for (var i = 0; i < ArcadeOS.collection.length; i++) {
				var media: Media = ArcadeOS.collection[i];
				var cols: Number = Math.floor(w / Media.BX);
				var spaceX: int = Media.BX + Media.MARG;
				var spaceY: int = Media.BY + Media.MARG;
				var gridX: int = i % cols;
				var gridY: int = Math.floor(i / cols);

				media.x = gridX * spaceX +view.sideWindowW;
				media.y = gridY * spaceY;

			}
		}

	}

}