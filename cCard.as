package
{	
	public class cCard
	{
		public static const SUIT_CLUB    = 0;
		public static const SUIT_SPADE   = 1;
		public static const SUIT_HEART   = 2;
		public static const SUIT_DIAMOND = 3;
		
		public var CardId      : Number;
		public var FrameId     : Number;
		public var Type	       : String;
		public var Suit	       : String;
		public var Code	       : String;
		public var Description : String;
		public var Value       : Number;
		
		function cCard(n_CardId      : Number,
					   n_FrameId	 : Number,
					   n_Type	     : String,
					   n_Suit		 : String,
					   n_Code		 : String,
					   n_Description : String,
					   n_Value       : Number)
		{
			CardId      = n_CardId
			FrameId 	= n_FrameId;
			Type		= n_Type;
			Suit 		= n_Suit;
			Code		= n_Code;
			Description = n_Description;			
			Value       = n_Value;
		}
	}
}


