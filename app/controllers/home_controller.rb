class HomeController < ApplicationController
  def index
    @day = Time.now.strftime("%B %e, %Y")
    #@day = Date.today.to_s

    score = 0
    color = ''
    appliances = Appliance.all
    appliances.each do |a|
      case a.rating
      when "A"
        score += 100
        color = '#00A151'
      when "B"
        score += 91
        color = '#00BB14'
      when "C"
        score += 80
        color = '#99D800'
      when "D"
        score += 68
      when "E"
        score += 54
      when "F"
        score += 38
      when "G"
        score += 20
      end
    end

    score = (score/Appliance.count).to_i
    case score
    when 92..100
      color = '#00A151'
    when 81..91
      color = '#00BB14'
    when 69..80
      color = '#99D800'
    when 55..68
      color = '#F6FF43'
    when 39..54
      color = '#FED435'
    when 21..38
      color = '#FF7600'
    when 0..20
      color = '#FF0000'
    end

    @data_score = {
    datasets: [{
      label: 'Score',
        data: [score, 100-score],

    backgroundColor: [
        color,
        '#FFFFFF']}]}



#    @data = {
#  labels: ["January", "February", "March", "April", "May", "June", "July"],
#  datasets: [
#    {
#        label: "My First dataset",
#        backgroundColor: "rgba(220,220,220,0.2)",
#        borderColor: "rgba(220,220,220,1)",
#        data: [65, 59, 80, 81, 56, 55, 40]
#    },
#    {
#        label: "My Second dataset",
#        backgroundColor: "rgba(151,187,205,0.2)",
#        borderColor: "rgba(151,187,205,1)",
#        data: [28, 48, 40, 19, 86, 27, 90]
#    }
#  ]
#}

last5Meters = Meter.last(5)

@data2 = {
labels: [last5Meters[0].end_date,last5Meters[1].end_date, last5Meters[2].end_date, last5Meters[3].end_date,last5Meters[4].end_date],
datasets: [{
    data: [last5Meters[0].readings,last5Meters[1].readings, last5Meters[2].readings, last5Meters[3].readings, last5Meters[4].readings],
    backgroundColor: [
        'rgba(255, 99, 132, 0.7)',
        'rgba(54, 162, 235, 0.7)',
        'rgba(255, 206, 86, 0.7)',
        'rgba(75, 192, 192, 0.7)',
        'rgba(153, 102, 255, 0.7)'
    ],
    borderColor: [
        'rgba(255,99,132,1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)'
    ],
    borderWidth: 1
}]
}


      @options =  {
      scales: {
          yAxes: [{
              ticks: { fontSize: 50,
                 beginAtZero:true}
              }],

          xAxes: [{
              ticks: { fontSize: 35,
                 beginAtZero:true}
              }]
          }
      }
  end

  end
