const newFeeds = [
  {
    "id": 1,
    "profile":
        "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png",
    "username": "Flutter",
    "imageUrl":
        "https://uploads-ssl.webflow.com/5f841209f4e71b2d70034471/6078b650748b8558d46ffb7f_Flutter%20app%20development.png",
    "likes": "4,713,639",
    "isLike": true,
    "caption": " ;",
    "comments": "View all 17,792 comments",
    "dateTime": "3 days ago"
  },
  {
    "id": 2,
    "profile":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Chrome_icon_%28September_2014%29.svg/1200px-Google_Chrome_icon_%28September_2014%29.svg.png",
    "username": "Google",
    "imageUrl": "https://events.google.com/io/assets/io_social_asset.jpg",
    "likes": "127,805",
    "isLike": true,
    "caption": "Google i/o",
    "comments": "View all 93 comments",
    "dateTime": "7 hours ago"
  },
  {
    "id": 3,
    "profile":
        "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?202107290458",
    "username": "Apple",
    "imageUrl":
        "https://image.cnbcfm.com/api/v1/image/106870997-1618935993880-Screen_Shot_2021-04-20_at_92603_AM.png?v=1618936026",
    "likes": "331,224",
    "isLike": true,
    "caption":
        "Apple Event April 2021 live updates: iPad Pros, new iMacs announced ",
    "comments": "View all 230 comments",
    "dateTime": "4 days ago"
  },
  {
    "id": 4,
    "profile":
        "https://yt3.ggpht.com/ytc/AKedOLTxAANt4In2gv9PzQX8lLEXPOe92v9w2wjIfKCqTQ=s900-c-k-c0x00ffffff-no-rj",
    "username": "Microsoft",
    "imageUrl": "https://i.ytimg.com/vi/2W0T2qGZ9Dc/maxresdefault.jpg",
    "likes": "126,113",
    "isLike": false,
    "caption": "Microsoft bundle",
    "comments": "View all 184 comments",
    "dateTime": "14 hours ago"
  },
  {
    "id": 5,
    "profile":
        "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png",
    "username": "Flutter",
    "imageUrl":
        "https://uploads-ssl.webflow.com/5f841209f4e71b2d70034471/6078b650748b8558d46ffb7f_Flutter%20app%20development.png",
    "likes": "4,713,639",
    "isLike": true,
    "caption": " ;",
    "comments": "View all 17,792 comments",
    "dateTime": "3 days ago"
  },
  {
    "id": 6,
    "profile":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Chrome_icon_%28September_2014%29.svg/1200px-Google_Chrome_icon_%28September_2014%29.svg.png",
    "username": "Google",
    "imageUrl": "https://events.google.com/io/assets/io_social_asset.jpg",
    "likes": "127,805",
    "isLike": true,
    "caption": "Google i/o",
    "comments": "View all 93 comments",
    "dateTime": "7 hours ago"
  },
  {
    "id": 7,
    "profile":
        "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?202107290458",
    "username": "Apple",
    "imageUrl":
        "https://image.cnbcfm.com/api/v1/image/106870997-1618935993880-Screen_Shot_2021-04-20_at_92603_AM.png?v=1618936026",
    "likes": "331,224",
    "isLike": true,
    "caption":
        "Apple Event April 2021 live updates: iPad Pros, new iMacs announced ",
    "comments": "View all 230 comments",
    "dateTime": "4 days ago"
  },
  {
    "id": 8,
    "profile":
        "https://yt3.ggpht.com/ytc/AKedOLTxAANt4In2gv9PzQX8lLEXPOe92v9w2wjIfKCqTQ=s900-c-k-c0x00ffffff-no-rj",
    "username": "Microsoft",
    "imageUrl": "https://i.ytimg.com/vi/2W0T2qGZ9Dc/maxresdefault.jpg",
    "likes": "126,113",
    "isLike": false,
    "caption": "Microsoft bundle",
    "comments": "View all 184 comments",
    "dateTime": "14 hours ago"
  },
  {
    "id": 9,
    "profile":
        "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png",
    "username": "Flutter",
    "imageUrl":
        "https://uploads-ssl.webflow.com/5f841209f4e71b2d70034471/6078b650748b8558d46ffb7f_Flutter%20app%20development.png",
    "likes": "4,713,639",
    "isLike": true,
    "caption": " ;",
    "comments": "View all 17,792 comments",
    "dateTime": "3 days ago"
  },
  {
    "id": 10,
    "profile":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Chrome_icon_%28September_2014%29.svg/1200px-Google_Chrome_icon_%28September_2014%29.svg.png",
    "username": "Google",
    "imageUrl": "https://events.google.com/io/assets/io_social_asset.jpg",
    "likes": "127,805",
    "isLike": true,
    "caption": "Google i/o",
    "comments": "View all 93 comments",
    "dateTime": "7 hours ago"
  },
  {
    "id": 11,
    "profile":
        "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?202107290458",
    "username": "Apple",
    "imageUrl":
        "https://image.cnbcfm.com/api/v1/image/106870997-1618935993880-Screen_Shot_2021-04-20_at_92603_AM.png?v=1618936026",
    "likes": "331,224",
    "isLike": true,
    "caption":
        "Apple Event April 2021 live updates: iPad Pros, new iMacs announced ",
    "comments": "View all 230 comments",
    "dateTime": "4 days ago"
  },
  {
    "id": 12,
    "profile":
        "https://yt3.ggpht.com/ytc/AKedOLTxAANt4In2gv9PzQX8lLEXPOe92v9w2wjIfKCqTQ=s900-c-k-c0x00ffffff-no-rj",
    "username": "Microsoft",
    "imageUrl": "https://i.ytimg.com/vi/2W0T2qGZ9Dc/maxresdefault.jpg",
    "likes": "126,113",
    "isLike": false,
    "caption": "Microsoft bundle",
    "comments": "View all 184 comments",
    "dateTime": "14 hours ago"
  },
  {
    "id": 13,
    "profile":
        "https://yt3.ggpht.com/ytc/AKedOLTxAANt4In2gv9PzQX8lLEXPOe92v9w2wjIfKCqTQ=s900-c-k-c0x00ffffff-no-rj",
    "username": "Microsoft",
    "imageUrl": "https://i.ytimg.com/vi/2W0T2qGZ9Dc/maxresdefault.jpg",
    "likes": "126,113",
    "isLike": false,
    "caption": "Microsoft bundle",
    "comments": "View all 184 comments",
    "dateTime": "14 hours ago"
  },
  {
    "id": 14,
    "profile":
        "https://yt3.ggpht.com/ytc/AKedOLTxAANt4In2gv9PzQX8lLEXPOe92v9w2wjIfKCqTQ=s900-c-k-c0x00ffffff-no-rj",
    "username": "Microsoft",
    "imageUrl": "https://i.ytimg.com/vi/2W0T2qGZ9Dc/maxresdefault.jpg",
    "likes": "126,113",
    "isLike": false,
    "caption": "Microsoft bundle",
    "comments": "View all 184 comments",
    "dateTime": "14 hours ago"
  },
];
