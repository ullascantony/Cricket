namespace Cricket.Domain.Models
{
    /// <summary>
    /// POCO class to map data from database procedure [dbo].[GetWorldCupPlayer]
    /// </summary>
    public class WorldCupPlayer : Player
    {
        #region Properties

        public int WorldCupPlayerID { get; set; }

        public short SpanBegin { get; set; }

        public short SpanEnd { get; set; }

        public short Matches { get; set; }

        public short Innings { get; set; }

        public short NotOut { get; set; }

        public int Runs { get; set; }

        public short Highest { get; set; }

        public bool HighestIsNotOut { get; set; }

        public int BallsFaced { get; set; }

        public short Centuries { get; set; }

        public short Fifties { get; set; }

        public short Ducks { get; set; }

        public short Fours { get; set; }

        public short Sixes { get; set; }

        #endregion

        #region Extended properties

        public decimal Average { get; set; }

        public decimal StrikeRate { get; set; }

        #endregion
    }
}
