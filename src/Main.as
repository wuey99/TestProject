package 
{
	import Assets.*;
	
// GX
	import GX.Mickey.*;
	
// X
	import X.*;
	
// flash
	import flash.display.Sprite;
	import flash.events.Event;

	//------------------------------------------------------------------------------------------
	/**
	 * ...
	 * @author wuey99
	 */
	//------------------------------------------------------------------------------------------
	public class Main extends Sprite  {
		public var self:Sprite;	
		
		public function Main():void  {
			trace (": starting: ");

			self = this;
			
			addEventListener (Event.ADDED_TO_STAGE, 
				function ():void {	
					trace (": (test project) added to stage: ");
					
					var __game:Game = new Game ();
					addChild (__game);
					
					__game.setup (_Assets, _MickeyX, self, 32);
				}
			);
		}
		
	//------------------------------------------------------------------------------------------
	}
	
//------------------------------------------------------------------------------------------	
}