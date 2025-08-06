using System;
using System.Collections.Generic;

namespace movieInfo
{
    struct MovieInfo
    {
        public string imdb;
        public string title;
        public string release;
        public string genre;
        public float rating;

        public MovieInfo(string imdb, string title, string release, string genre, float rating)
        {
            this.imdb = imdb;
            this.title = title;
            this.release = release;
            this.genre = genre;
            this.rating = rating;
        }

        public void GetInfo()
        {
            Console.WriteLine($"\nIMDB   : {imdb}");
            Console.WriteLine($"Title  : {title}");
            Console.WriteLine($"Release: {release}");
            Console.WriteLine($"Genre  : {genre}");
            Console.WriteLine($"Rating : {rating}");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<MovieInfo> movieList = new List<MovieInfo>
            {
                new MovieInfo("tt0372784", "Batman Begins", "15 Jun 2005", "Action, Crime, Drama", 8.2f),
                new MovieInfo("tt0468569", "The Dark Knight", "18 Jul 2008", "Action, Crime, Drama", 9.0f),
                new MovieInfo("tt1345836", "The Dark Knight Rises", "20 Jul 2012", "Action, Crime, Drama", 8.4f),
                new MovieInfo("tt2975590", "Batman v Superman: Dawn of Justice", "25 Mar 2016", "Action, Adventure, Sci-Fi", 6.4f),
                new MovieInfo("tt1877830", "The Batman", "04 Mar 2022", "Action, Crime, Drama", 7.8f)
            };

            var topRanking = movieList.OrderByDescending(m => m.rating);

            foreach (var movie in topRanking)
            {
                movie.GetInfo();
            }

            static (int, float, string) getTopValue()
            {
                return (20, 3.21f, "apple");
            }

            
        }
    }
}
