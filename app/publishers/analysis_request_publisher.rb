class AnalysisRequestPublisher
  def self.publish(analysis_request)
    analysis_request.analyses.each do |analysis|
      # TODO: add exchange property to file processor
      # Use the analysis_request JSON rendering to create the AMQP message
      super(
        analysis.file_processor.name,
        AnalysesController.render(template: 'analysis_requests/show.json',
                                  assigns: { analysis_request: analysis_request })
      )
      yield(analysis)
    end
  end
end
