@php
$color_header = '#F0F0F0';
$color_border = '#000000';
$color_border_lighter = '#CCCCCC';
$color_line_even = '#FFFFFF';
$color_line_odd = '#F9F9F9';
$font_size_text = '9pt';
$font_size_header = '9pt';
$font_size_product = '9pt';
$height_header = '20px';
$table_padding = '4px';
$box_color = '#eaeaf1';
@endphp
<style>
    table,
    th,
    td {
        margin: 0 !important;
        padding: 0 !important;
        vertical-align: middle;
        font-size: {{ $font_size_text }};
        white-space: nowrap;
    }

    table.product {
        /*border: 0.5px solid {{ $color_border }};*/
        border-collapse: collapse;
    }

    table#addresses-tab tr td {
        font-size: large;
    }

    table#summary-tab {
        padding: {{ $table_padding }};
        border: 1pt solid {{ $color_border }};
    }

    table#total-tab {
        padding: {{ $table_padding }};
        /* border: 1pt solid {{ $color_border }}; */
    }

    table#note-tab {
        padding: {{ $table_padding }};
        border: 0.5px solid {{ $color_border }};
    }

    table#note-tab td.note {
        word-wrap: break-word;
    }

    table#tax-tab {
        padding: {{ $table_padding }};
        border: 1pt solid {{ $color_border }};
    }

    table#payment-tab,
    table#shipping-tab {
        padding: {{ $table_padding }};
        border: 0.5px solid {{ $color_border }};
    }

    th.product {
        /*border-bottom: 0.5px solid {{ $color_border }};*/
    }

    tr.discount th.header {
        border: 0.5px solid {{ $color_border }};
    }

    tr.product td {
        /*border-bottom: 0.5px solid {{ $color_border_lighter }};*/
    }

    tr.color_line_even {
        background-color: {{ $color_line_even }};
    }

    tr.color_line_odd {
        background-color: {{ $color_line_odd }};
    }

    tr.customization_data td {}

    td.product {
        vertical-align: middle;
        font-size: {{ $font_size_product }};
    }

    th.header {
        font-size: {{ $font_size_header }};
        height: {{ $height_header }};
        /*border: 0.5px solid {{ $color_border }};*/
        vertical-align: middle;
        text-align: center;
        font-weight: bold;
        background-color:#eaeaf1;
    }

    th.header-right {
        font-size: {{ $font_size_header }};
        height: {{ $height_header }};
        /* background-color: {{ $color_header }}; */
        vertical-align: middle;
        text-align: right;
        font-weight: bold;
    }

    th.payment,
    th.shipping {
        background-color: {{ $color_header }};
        vertical-align: middle;
        font-weight: bold;
    }

    th.tva {
        background-color: {{ $color_header }};
        vertical-align: middle;
        font-weight: bold;
    }

    tr.separator td {
        border-top: 0.5px solid #000000;
    }

    .left {
        text-align: left;
    }

    .fright {
        float: right;
    }

    .right {
        text-align: right;
    }

    .center {
        text-align: center;
    }

    .bold {
        font-weight: bold;
    }

    .text-style {
        font-size: 8px;

    }

    .address-text {
        font-weight: bold;
    }

    .total-text {
        font-size: 20px;
    }

    .border {
        /*border: 0.5px solid black;*/
    }

    .hrdash{
      border-bottom: 1px dashed solid black;
    }

    .border-left {
        /*border-left: 0.5px solid #D6D6D6;*/
    }

    .no_top_border {
        border-top: hidden;
        border-bottom: 0.5px solid black;
        border-left: 0.5px solid black;
        border-right: 0.5px solid black;
    }

    .grey {
        background-color: {{ $color_header }};
    }
    .boxcolor {
      background-color:{{ $box_color }};
     
    }
    div.test {
        background-color: #D0D0D0;
        border-radius: 15px;
    }
    .vertical {
        border-left: 0.5px solid black;
        height: 10px;
        position:absolute;
        left: 50%;
        border-top: 0.5px solid black;
    }

    .boxsizing: {
      box-sizing: content-box;

    }
    /* This is used for the border size */
    .white {
        background-color: #FFFFFF;
    }

    .big,
    tr.big td {
        font-size: 110%;
    }

    .small,
    table.small th,
    table.small td {
        font-size: medium;
    }

    .student,
    table.student tr td:first-child{background-color:#eaeaf1;}
    
    .vl {
      border-left: 6px solid black;
      height: 5px;
    }
</style>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<table width="100%" id="body" border="0" cellpadding="0" cellspacing="0">
  
  <tr colspan="12">
    <td colspan="5">
      <table id="addresses-tab" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="3">
            <br />
            <span class="address-text">@lang('Raiffeisen OÖ Ventures eGen:') </span> <br /> <br />
            Europapl. 1a <br />
            4020 Linz <br />
            Österreich <br />

          </td>
          <td colspan="3"></td>
        </tr>
        <br />
        <tr>
          <td colspan="3">
            <br />
            <span class="address-text">@lang('Rechnungsadresse') </span> <br /> <br />
            {{ $provider_payout->provider->company_name }} <br />
            {{ $provider_payout->provider->street . ' ' . $provider_payout->provider->street_number }} <br />
            {{ $provider_payout->provider->postal_code . ' ' . $provider_payout->provider->city }} <br />
            Österreich <br />
          </td>
          <td colspan="3">
          </td>
        </tr>
      </table>
    </td>
    <td colspan="7">
   
      <table id="addresses-tab" cellspacing="0" cellpadding="0">
        <tr>
          <div style="border: 0.5px solid black; padding-top: 4px;">
            <tr>
              <td class="border" style="text-align: center;"><span class="address-text"style="line-height: 5px;">
                @lang('Rechnungs-Nr.: ')&nbsp;{{ $provider_payout->invoice_number }}</span>
              </td>
            </tr>
          </div>
          <br />
          <td>
            <table class="table__data mt-1">
              <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('Rechnungsdatum: ')</span>
                  </td>
                  <td>
                    <span class="small">{{ $provider_payout->updated_at->format(setting('date_format')) }}</span>
                  </td>
              </tr>
              <tr style="line-height:20px">
                <td>
                  <span class="small">@lang('Kunden-Nr.:')</span>
                </td>
                <td>
                  <span class="small">{{ $provider_payout->provider_id }}</span>
                </td>
              </tr>
               <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('USt.-ID:')</span>
                  </td>
                  <td>
                    <span class="small">{{ $provider_payout->provider->vat_number }}</span>
                  </td>
              </tr> <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('Liefer-/Leistungsdatum:')</span>
                  </td>
                  <td>
                    <span class="small">{{ $provider_payout->start_period_date->format(setting('date_format')) . ' - ' . $provider_payout->end_period_date->format(setting('date_format')) }}</span>
                  </td>
              </tr>
             
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <br />
  <br />
  <tr>
    <td colspan="12">
      <table class="product" width="100%" cellpadding="4" cellspacing="0">
        <thead>
            <tr>
              <th class="product header small" width="5%">@lang('Pos')</th>
              <th class="product header small" width="5%">@lang('Anz.')</th>
              <th class="product header small" width="15%">@lang('Artikel-Nr.')</th>
              <th class="product header small" width="27%">@lang('Artikel')</th>
              <th class="product header small" width="8%">@lang('MwSt.')</th>
              <th class="product header small" width="20%">@lang('Einzelpreis') <small>@lang('(Inkl. MwSt.)')</small></th>
              <th class="product header small" width="20%">@lang('Gesamtpreis')<small>@lang('(Inkl. MwSt.)')</small></th>
            </tr>
        </thead>
        <tbody>
          @foreach($provider_data as $item)
          <tr>
            <td class="border center">{{ $loop->index + 1 }}</td>
            <td class="border center">{{ $item->quantity }}</td>
            <td class="border center">{{ $item->product_id }}</td>
            <td class="border center">{{ $item->product_name }}</td>
            <td class="border center">{{ filled($item->product_tax) ? $item->product_tax : 0 }}%</td>
            <td class="border center">{{ number_format($item->getPriceIncluded(), 2, ',', '.') }} €</td>
            <td class="border center">{{ number_format($item->getPriceIncluded() * $item->quantity, 2, ',', '.') }} €</td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </td>
  </tr>
  <br />
  <br />
  <br />
  <tr>
    <td colspan="12">
      <table class="product" width="100%" cellpadding="4" cellspacing="0">
        <thead>
            <tr>
              <th class="product header small" width="20%">@lang('Steuerdetails')</th>
              <th class="product header small" width="20%">@lang('Steuersatz')</th>
              <th class="product header small" width="20%">@lang('MwSt. in €')</th>
              <th class="product header small" width="20%">@lang('VK netto')</th>
              <th class="product header small" width="20%">@lang('Gesamt (inkl. MwSt.)')</th>
            </tr>
        </thead>
        <tbody>
           @php
                $totalPriceIncluded = 0;
                $totalPriceExcluded = 0;
            @endphp
          @foreach($provider_data as $item)
        @php
            $totalPriceIncluded += $item->getPriceIncluded();
            $totalPriceExcluded += $item->getPriceExcluded();
            $totalShippingCost = $item->getTotalShippingCost();
        @endphp
          <tr>
            <td class="border center student">Artikel</td>
            <td class="border center">{{ filled($item->product_tax) ? $item->product_tax : 0 }}%</td>
            <td class="border center">{{ number_format((($item->getPriceIncluded() - $item->getPriceExcluded())* $item->quantity), 2, ',', '.') }} €</td>
            <td class="border center">{{ number_format(($item->getPriceExcluded()* $item->quantity), 2, ',', '.') }} €</td>
            <td class="border center">{{ number_format(($item->getPriceIncluded()* $item->quantity), 2, ',', '.') }} €</td>
          </tr>
        @endforeach
        <tr>
          <td class="border center student">Gesamt</td>
          <td class="border center"></td>
         <td class="border center">
          {{ number_format(($vendor_orders[0]->amount_tax_included - $vendor_orders[0]->amount_tax_excluded) + ($vendor_orders[0]->shipping_amount * 20) / 100, 2, ',', '.') }}
          €</td>
          <td class="border center">
          {{ number_format($vendor_orders[0]->amount_tax_excluded + ($vendor_orders[0]->shipping_amount - (($vendor_orders[0]->shipping_amount * 20) / 100)), 2, ',', '.') }}
          €</td>
          <td class="border center">
          {{ number_format($vendor_orders[0]->amount_tax_included + $vendor_orders[0]->shipping_amount, 2, ',', '.') }}
          €</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>

  <br />
  <br />
  <br />
  <br />

  <tr>
    <td colspan="5">
      <table id="addresses-tab">
        <tr>
          <td colspan="12">
            <table width="100%" cellpadding="3" cellspacing="0" style="border: 0.5px solid black;">
              <tr>
                <td class="boxcolor" colspan="6">
                  <span class="address-text" style="text-align: left;">@lang('Zahlungsart') </span>
                </td>
                <td class="vertical" colspan="6" style="text-align: right;">
                  <span class="address-text">rfrr<small>  32323434 </small></span>
                </td>
              </tr>
              <tr>
                <td class="boxcolor" colspan="6">
                  <span class="address-text" style="text-align: left;">@lang('Versanddienst') </span>
                </td>
                <td  class="vertical" colspan="6" style="text-align: right;">
                 <span class="address-text">fdgffddf </span>
                </td>
              </tr>       
            </table>
          </td>
        </tr>
      </table>
    </td>

    <td colspan="1" ></td>
    <td colspan="6">
      <table class="boxcolor"  width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="12">
               <table width="100%" cellpadding="2" cellspacing="0">
                    <tr style="line-height:20px"> 
                        <td style="text-align: left"><span class="address-text">@lang('Warenwert (netto)')</span></td>
                        <td style="text-align: right;"><span class="address-text">{{ number_format($vendor_orders->sum('amount_tax_excluded'), 2, ',', '.') }} €</span></td>
                    </tr>
                    <hr>
                    <tr style="line-height:20px">
                        <td><span class="address-text">@lang('Rabatt')</span></td>
                        <td style="text-align: right;"><span class="address-text"><span class="address-text">@lang('-') </span>{{ number_format($vendor_orders->sum('discount_amount'), 2, ',', '.') }} €</span></td>
                    </tr>
                    <tr style="line-height:20px">
                        <td><span class="address-text">@lang('Zwischensumme (netto)')</span></td>
                        <td style="text-align: right;"><span class="address-text">{{ number_format(($vendor_orders->sum('amount_tax_excluded') - $vendor_orders->sum('discount_amount')), 2, ',', '.') }} €</span></td>
                    </tr>
                    <hr>
                    <tr style="line-height:20px">
                        <td><span class="address-text">@lang('Versandkosten Inkl.MwSt.')</span></td>
                        <td style="text-align: right;"><span class="address-text">{{ number_format($vendor_orders->sum('shipping_amount'), 2, ',', '.') }} €</span></td>
                    </tr>
                    @foreach($provider_data as $item)
                      <tr style="line-height:10px">
                        <td><span class="address-text">{{ filled($item->product_tax) ? $item->product_tax : 0 }}% MwSt.</span></td>
                        <td style="text-align: right;"><span class="address-text">{{ number_format(($item->getPriceIncluded() - $item->getPriceExcluded())* $item->quantity, 2, ',', '.') }} €</span></td>
                      </tr>
                    @endforeach
                    <hr>
                    <tr style="line-height:20px">
                        <td><span class="address-text">@lang('Rechnungsbetrag')</span></td>
                        <td style="text-align: right;"><span class="address-text">{{ number_format($vendor_orders->sum('total_amount'), 2, ',', '.') }} €</span></td>
                    </tr>
                </table>
            </td>
        </tr>
      </table>
    </td>
  </tr>

 
</table>