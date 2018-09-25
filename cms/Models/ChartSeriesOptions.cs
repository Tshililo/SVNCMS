using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cms.Models
{
    public class ChartSeriesOptions
    {
   
            public const string AgeGroup = "AgeGroup";
            public const string Amount = "Amount";

            bool showLabels;
            object data;
            string seriesDataMember = Amount;

            public bool ShowLabels
            {
                get { return showLabels; }
                set { showLabels = value; }
            }
            public string SeriesDataMember
            {
                get { return seriesDataMember; }
                set { seriesDataMember = string.IsNullOrEmpty(value) ? Amount : value; }
            }
            public object Data
            {
                get { return data; }
                set { data = value; }
            }
            public string ArgumentDataMember { get { return seriesDataMember == AgeGroup ? Amount : Amount; } }

            public ChartSeriesOptions() { }
        
    }
}