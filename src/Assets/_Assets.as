//------------------------------------------------------------------------------------------
// <$begin$/>
// <$end$/>
//------------------------------------------------------------------------------------------
package Assets {
	
	import GX.Assets.*;
	
	import X.*;
	import X.Resource.Manager.*;
	
	import flash.display.*;
	import flash.media.*;
	
//------------------------------------------------------------------------------------------	
	public class _Assets extends XAssets {

//------------------------------------------------------------------------------------------		
		[Embed(source="Aller_Rg.ttf",
			fontName="Aller",  
			mimeType = "application/x-font", 
			// fontWeight="normal", 
			fontStyle="normal", 
			unicodeRange="U+0020-U+007E", 
			embedAsCFF="false"
		)]
		public static const ArialFontClass:Class;

		[Embed(source="BELL.TTF",
			fontName="Bell MT",  
			mimeType = "application/x-font", 
			// fontWeight="normal", 
			fontStyle="normal", 
			unicodeRange="U+0020-U+007E", 
			embedAsCFF="false"
		)]
		public static const BellMTFontClass:Class;
		
		[Embed(source="BRLNSB.ttf",
			fontName="BrlnSB",  
			mimeType = "application/x-font", 
			// fontWeight="normal", 
			fontStyle="normal", 
			unicodeRange="U+0020-U+007E", 
			embedAsCFF="false"
		)]
		public static const BrlnSBFontClass:Class;
		
		[Embed(source="BRLNSDB.ttf",
			fontName="BrlnSDB",  
			mimeType = "application/x-font", 
			// fontWeight="normal", 
			fontStyle="normal", 
			unicodeRange="U+0020-U+007E", 
			embedAsCFF="false"
		)]
		public static const BrlnSDBFontClass:Class;
		
		[Embed(source="BRLNSR.ttf",
			fontName="BrlnSR",  
			mimeType = "application/x-font", 
			// fontWeight="normal", 
			fontStyle="normal", 
			unicodeRange="U+0020-U+007E", 
			embedAsCFF="false"
		)]
		public static const BrlnSRFontClass:Class;
		
		[Embed(source="Iconset.ttf",
			fontName="Iconset",  
			mimeType = "application/x-font", 
			// fontWeight="normal", 
			fontStyle="normal", 
			unicodeRange="U+0020-U+007E", 
			embedAsCFF="false"
		)]
		public static const IconsetFontClass:Class;
			
//------------------------------------------------------------------------------------------
		include "Cows\\Project\\_EmbeddedAssets.as";

//------------------------------------------------------------------------------------------
		public function _Assets (__XApp:XApp, __parent:Sprite) {
			super (__XApp, __parent);
			
			var __projectManager:XProjectManager = new XProjectManager (m_XApp);
			
			__projectManager.setupFromXML (
				__parent,
				"Assets\\Cows\\Project",
				m_projectXML,
				null,
				null
				);
			
			m_XApp.setProjectManager (__projectManager);
						
			addEmbeddedAssets ();
		}
		
//------------------------------------------------------------------------------------------
		public override function load ():Boolean {			
			return m_XApp.cacheAllClasses (m_projectXML);
		}
					
//------------------------------------------------------------------------------------------
	}
	
//------------------------------------------------------------------------------------------
} 	