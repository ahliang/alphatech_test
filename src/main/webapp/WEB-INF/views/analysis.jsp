<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <jsp:include page="fragments/header.jsp" />
    </head>

    <body>
        <div class="form-container" style="margin-top:50px">
            <h1>New Analysis</h1>
            <form class="form-horizontal" action="/performAnalysis" method="POST">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Facebook Post Link:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="url_link" name="url_link" placeholder="Enter URL">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Type of Analysis:</label>
                    <div class="col-sm-10">
                        <select class="form-control" id="anal_type" name="anal_type" required>
                            <option value="" selected disabled>Please select type of Analysis...</option>
                            <option value="Sentiment Analysis">Sentiment Analysis</option>
                            <option value="Customer Purchase Intent">Customer Purchase Intent</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                </div>
        	</form>
        </div>
    </body>

    </html>