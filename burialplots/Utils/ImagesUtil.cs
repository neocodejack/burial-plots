using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
using ImageResizer;

namespace BurialPlots.Utills
{
    public class ImagesUtil
    {
        public Byte[] GetImageThumbnail(string image, int width, int height)
        {

            Image _image = Image.FromFile(image);

            float imgWidth = _image.PhysicalDimension.Width;
            float imgHeight = _image.PhysicalDimension.Height;


            //generating the thumbnail
            System.Drawing.Image thumbnail = _image.GetThumbnailImage(width, height, delegate () { return false; }, (IntPtr)0);

            // Converting Image File to byte Array
            Byte[] imgBytes = null;
            try
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    thumbnail.Save(ms, ImageFormat.Jpeg);
                    imgBytes = ms.ToArray();
                }
            }
            catch
            {

            }
            return imgBytes;

        }


        public bool ImageResizeAndCrop(string filePath, string targetSavedPath, int width, int height)
        {
            try
            {
                ImageBuilder.Current.Build(filePath, targetSavedPath,
                new ResizeSettings("width=" + width + "&height=" + height + "&crop=auto"));

                return true;
            }
            catch (Exception ex)
            {

                return false;
            }



        }

        public bool ImageResizeAndCrop(byte[] byteArray, string targetSavedPath, int width, int height)
        {
            try
            {
                Stream stream = new MemoryStream(byteArray);
                return ImageResizeAndCrop(stream, targetSavedPath, width, height);
            }
            catch (Exception ex)
            {
                return false;
            }

        }



        public bool ImageResizeAndCrop(Stream stream, string targetSavedPath, int width, int height)
        {
            try
            {
                ImageBuilder.Current.Build(stream, targetSavedPath,
                new ResizeSettings("width=" + width + "&height=" + height + "&crop=auto"));

                return true;
            }
            catch (Exception ex)
            {

                return false;
            }



        }

        public byte[] ImageToByteArray(System.Drawing.Image imageIn)
        {
            MemoryStream ms = new MemoryStream();
            imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            return ms.ToArray();
        }

        public Image LoadImageFromBase64(String base64String)
        {

            String[] arr = base64String.Split(',');

            string newBase64String = arr[1];

            //get a temp image from bytes, instead of loading from disk
            //data:image/gif;base64,
            //this image is a single pixel (black)
            byte[] bytes = Convert.FromBase64String(newBase64String);

            Image image;
            using (MemoryStream ms = new MemoryStream(bytes))
            {
                image = Image.FromStream(ms);
            }

            return image;
        }


        //public byte[] ResizImageAtRunTime(string filePath, int width, int height)
        //{
        //    try
        //    {
        //        ResizeSettings settings = new ResizeSettings("width=" + width + "&height=" + height + "&crop=auto");

        //        Bitmap bitmap = ImageBuilder.Current.Build(filePath, settings);


        //        ImageConverter converter = new ImageConverter();

        //        return (byte[])converter.ConvertTo(bitmap, typeof(byte[]));
        //    }
        //    catch (Exception ex)
        //    {
        //        return null;
        //    }
        //}

        //public byte[] ResizImageAtRunTime(MemoryStream ms, int width, int height)
        //{
        //    try
        //    {
        //        ResizeSettings settings = new ResizeSettings("width=" + width + "&height=" + height + "&crop=auto");

        //        ms.Seek(0, SeekOrigin.Begin);
        //        Bitmap bitmap = ImageBuilder.Current.Build(ms, settings);


        //        ImageConverter converter = new ImageConverter();

        //        return (byte[])converter.ConvertTo(bitmap, typeof(byte[]));
        //    }
        //    catch (Exception)
        //    {
        //        return null;
        //    }
        //}



        //public byte[] ResizImageAtRunTime(Stream ms, int width, int height)
        //{
        //    try
        //    {
        //        ResizeSettings settings = new ResizeSettings("width=" + width + "&height=" + height + "&crop=auto");

        //        ms.Seek(0, SeekOrigin.Begin);
        //        Bitmap bitmap = ImageBuilder.Current.Build(ms, settings);


        //        ImageConverter converter = new ImageConverter();

        //        return (byte[])converter.ConvertTo(bitmap, typeof(byte[]));
        //    }
        //    catch (Exception)
        //    {
        //        return null;
        //    }
        //}


        public static Bitmap Convert_Text_to_Image(string txt, string fontname, int fontsize = 24)
        {
            //creating bitmap image
            Bitmap bmp = new Bitmap(1, 1);


            int marginLeft = 0;
            if (txt.Length < 6)
                marginLeft = 10;

            int newFontsize = fontsize - (txt.Length + 1);

            if (newFontsize < 10) newFontsize = 10;


            //FromImage method creates a new Graphics from the specified Image.
            Graphics graphics = Graphics.FromImage(bmp);
            // Create the Font object for the image text drawing.
            Font font = new Font(fontname, newFontsize);
            // Instantiating object of Bitmap image again with the correct size for the text and font.
            SizeF stringSize = graphics.MeasureString(txt, font);
            bmp = new Bitmap(bmp, 107, 82);
            //

            graphics = Graphics.FromImage(bmp);
            graphics.Clear(Color.White);
            /* It can also be a way
           bmp = new Bitmap(bmp, new Size((int)graphics.MeasureString(txt, font).Width, (int)graphics.MeasureString(txt, font).Height));*/

            //Draw Specified text with specified format 


            graphics.DrawString(txt, font, Brushes.Black, marginLeft, 25);
            font.Dispose();
            graphics.Flush();
            graphics.Dispose();
            return bmp;     //return Bitmap Image 
        }
    }
}