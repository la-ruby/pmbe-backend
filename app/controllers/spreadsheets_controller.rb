# frozen_string_literal: true

# Must rename this
class SpreadsheetsController < ApplicationController

  HEADINGS = ['DIVISION','DEPT NAME','CATEGORY','CLASS NAME','SUBCLASS','STYLE CODE','STYLE NAME','DISPLAYNAME','STYLE COLOR','VENDOR NAME','PHOTO','PLUS PHOTO','COLOR NAME','FABRIC NAME','BODYFIT','DETAIL','PATTERNPRINT','COLLECTION','LIFESTYLE','CORE CATEGORY','NEW STYLE COLOR','NEW STYLE','FIRST RECEIVED','LAST RECEIVED','CURRENT COST','SALES PRICE','COMPARE AT PRICE','ORIGINAL PRICE','IMU %','MMU %','REG/MARKDOWN','LAST MARKDOWN','SHOPIFY VISIBILITY','AVG CUSTOMER RATING','CUSTOMER REVIEWS','CUSTOMER REQUESTS','MODEL NAME','PLUS MODEL','INFLUENCER NAME','INFLUENCER UPLOAD DATE','BUYER','AGE','QC HOLD','JR Sales Units','JR Sales Units 1 Wk Ago','JR Sales Units 2 Wk Ago','JR Sales Units 3 Wk Ago','JR Sales Units Last 4 Weeks','JR MTD Sales Units','JR YTD Sales Units','JR LTD Sales Units','JR EOP Units','JR WOH Units','JR Tot OO Units','JR Tot OO Retail','JR Tot OO Cost','JR Tot OO IMU%','JR Next Order Due Date','JR Last Order Due Date','JR OO Units Curr Month','JR OO Units Next Month','JR OO Units in 2 Months','JR OO Units in 3 Months','JR OO Units in 4 Months','JR OO Units in 5 Months','JR OO Units in 6 Months','JR Avg Daily Sales Units','JR Avg Daily Sales Units 1 Ago','JR Avg Daily Sales Units 2 Ago','JR Avg Daily Sales Units 3 Ago','JR Sales Retail','JR Sales Retail MTD','JR Sales Retail YTD','JR GM$','JR GM$ MTD','JR GM$ YTD','JR GM%','JR GM% MTD','JR GM% YTD','PLUS Sales Units','PLUS Sales Units 1 Wk Ago','PLUS Sales Units 2 Wk Ago','PLUS Sales Units 3 Wk Ago','PLUS Sales Units Last 4 Weeks','PLUS MTD Sales Units','PLUS YTD Sales Units','PLUS LTD Sales Units','PLUS EOP Units','PLUS WOH Units','PLUS Tot OO Units','PLUS Tot OO Retail','PLUS Tot OO Cost','PLUS Tot OO IMU%','PLUS Next Order Due Date','PLUS Last Order Due Date','PLUS OO Units Curr Month','PLUS OO Units Next Month','PLUS OO Units in 2 Months','PLUS OO Units in 3 Months','PLUS OO Units in 4 Months','PLUS OO Units in 5 Months','PLUS OO Units in 6 Months','PLUS Avg Daily Sales Units','PLUS Avg Daily Sales Units 1 Ago','PLUS Avg Daily Sales Units 2 Ago','PLUS Avg Daily Sales Units 3 Ago','PLUS Sales Retail','PLUS Sales Retail MTD','PLUS Sales Retail YTD','PLUS GM$','PLUS GM$ MTD','PLUS GM$ YTD','PLUS GM%','PLUS GM% MTD','PLUS GM% YTD',' Total Sales Units',' Total Sales Units 1 Wk Ago',' Total Sales Units 2 Wk Ago',' Total Sales Units 3 Wk Ago',' Total Sales Units Last 4 Weeks',' Total MTD Sales Units',' Total YTD Sales Units',' Total LTD Sales Units',' Total EOP Units',' Total WOH Units',' Total Tot OO Units',' Total Tot OO Retail',' Total Tot OO Cost',' Total Tot OO IMU%',' Total Next Order Due Date',' Total Last Order Due Date',' Total OO Units Curr Month',' Total OO Units Next Month',' Total OO Units in 2 Months',' Total OO Units in 3 Months',' Total OO Units in 4 Months',' Total OO Units in 5 Months',' Total OO Units in 6 Months',' Total Avg Daily Sales Units',' Total Avg Daily Sales Units 1 Ago',' Total Avg Daily Sales Units 2 Ago',' Total Avg Daily Sales Units 3 Ago',' Total Sales Retail',' Total Sales Retail MTD',' Total Sales Retail YTD',' Total GM$',' Total GM$ MTD',' Total GM$ YTD',' Total GM%',' Total GM% MTD',' Total GM% YTD']
  HEADINGS_HASH = Hash[HEADINGS.collect{|item|['x_'+item.parameterize.underscore, item] } ]

  def edit
  end

  def update
    Rails.logger.info "Received #{params[:spreadsheet]}"
    Product.delete_all
    
    a = Roo::Spreadsheet.open(params[:spreadsheet])
    # a.header_line = 2

    Product.insert_all(a.each(HEADINGS_HASH))

    Product.where(x_division: 'DIVISION').delete_all # this is a header that slipped through
    #  next if index == 0
    #  puts "> #{item.inspect}"
    #end
    flash[:notice] = "Uploaded #{Product.count}"
    redirect_to "/upload"
  end
end
