class HomeController < ApplicationController
  def index
    @user = current_user
    @day = Time.now.strftime("%B %e, %Y")

    score = 0
    color = ''
    appliances = current_user.appliances.all
    if appliances.empty?
      @data_score = nil
    else
      appliances.each do |a|
        case a.rating
        when "A"
          score += 100
        when "B"
          score += 91
        when "C"
          score += 80
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
    end

last5Meters = current_user.meters.last(5)
case last5Meters.size
when nil
  @data2 = nil
when 5
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
                   beginAtZero:true},
                scaleLabel: {
                  fontSize: 35,
                  display:true,
                  labelString: 'Usage'
                }
                }],

            xAxes: [{
                ticks: { fontSize: 35,
                   beginAtZero:true},
                   scaleLabel: {
                     fontSize: 35,
                     display:true,
                     labelString: 'End date'
                   }
                }]
            }
        }
  when 4
    @data2 = {
    labels: [last5Meters[0].end_date,last5Meters[1].end_date, last5Meters[2].end_date, last5Meters[3].end_date],
    datasets: [{
        data: [last5Meters[0].readings,last5Meters[1].readings, last5Meters[2].readings, last5Meters[3].readings],
        backgroundColor: [
            'rgba(255, 99, 132, 0.7)',
            'rgba(54, 162, 235, 0.7)',
            'rgba(255, 206, 86, 0.7)',
            'rgba(75, 192, 192, 0.7)'
        ],
        borderColor: [
            'rgba(255,99,132,1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)'
        ],
        borderWidth: 1
    }]
    }


          @options =  {
          scales: {
              yAxes: [{
                  ticks: { fontSize: 50,
                     beginAtZero:true},
                  scaleLabel: {
                    fontSize: 35,
                    display:true,
                    labelString: 'Usage'
                  }
                  }],

              xAxes: [{
                  ticks: { fontSize: 35,
                     beginAtZero:true},
                     scaleLabel: {
                       fontSize: 35,
                       display:true,
                       labelString: 'End date'
                     }
                  }]
              }
          }
  when 3

    @data2 = {
    labels: [last5Meters[0].end_date,last5Meters[1].end_date, last5Meters[2].end_date],
    datasets: [{
        data: [last5Meters[0].readings,last5Meters[1].readings, last5Meters[2].readings],
        backgroundColor: [
            'rgba(255, 99, 132, 0.7)',
            'rgba(54, 162, 235, 0.7)',
            'rgba(255, 206, 86, 0.7)'
        ],
        borderColor: [
            'rgba(255,99,132,1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)'
        ],
        borderWidth: 1
    }]
    }


          @options =  {
          scales: {
              yAxes: [{
                  ticks: { fontSize: 50,
                     beginAtZero:true},
                  scaleLabel: {
                    fontSize: 35,
                    display:true,
                    labelString: 'Usage'
                  }
                  }],

              xAxes: [{
                  ticks: { fontSize: 35,
                     beginAtZero:true},
                     scaleLabel: {
                       fontSize: 35,
                       display:true,
                       labelString: 'End date'
                     }
                  }]
              }
          }
  when 2

    @data2 = {
    labels: [last5Meters[0].end_date,last5Meters[1].end_date],
    datasets: [{
        data: [last5Meters[0].readings,last5Meters[1].readings],
        backgroundColor: [
            'rgba(255, 99, 132, 0.7)',
            'rgba(54, 162, 235, 0.7)'
        ],
        borderColor: [
            'rgba(255,99,132,1)',
            'rgba(54, 162, 235, 1)'],
        borderWidth: 1
    }]
    }


          @options =  {
          scales: {
              yAxes: [{
                  ticks: { fontSize: 50,
                     beginAtZero:true},
                  scaleLabel: {
                    fontSize: 35,
                    display:true,
                    labelString: 'Usage'
                  }
                  }],

              xAxes: [{
                  ticks: { fontSize: 35,
                     beginAtZero:true},
                     scaleLabel: {
                       fontSize: 35,
                       display:true,
                       labelString: 'End date'
                     }
                  }]
              }
          }
  when 1

    @data2 = {
    labels: [last5Meters[0].end_date],
    datasets: [{
        data: [last5Meters[0].readings],
        backgroundColor: [
            'rgba(255, 99, 132, 0.7)'
        ],
        borderColor: [
            'rgba(255,99,132,1)'        ],
        borderWidth: 1
    }]
    }


          @options =  {
          scales: {
              yAxes: [{
                  ticks: { fontSize: 50,
                     beginAtZero:true},
                  scaleLabel: {
                    fontSize: 35,
                    display:true,
                    labelString: 'Usage'
                  }
                  }],

              xAxes: [{
                  ticks: { fontSize: 35,
                     beginAtZero:true},
                     scaleLabel: {
                       fontSize: 35,
                       display:true,
                       labelString: 'End date'
                     }
                  }]
              }
          }
  end
  end

  end
